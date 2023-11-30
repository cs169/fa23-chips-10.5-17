require 'google/apis/civicinfo_v2'

class Representative < ApplicationRecord
  has_many :news_items, dependent: :delete_all

  def self.civic_api_to_representative_params(rep_info)
    reps = []

    rep_info.officials.each_with_index do |official, index|
      ocdid_temp = ''
      title_temp = ''

      rep_info.offices.each do |office|
        if office.official_indices.include? index
          title_temp = office.name
          ocdid_temp = office.division_id
        end
      end

      rep = Representative.find_or_initialize_by(name: official.name)
      if rep.nil?
        rep = Representative.create!(
          {
            name: official.name,
            ocdid: ocdid_temp,
            title: title_temp,
            party: official.party,
            # photo: official.photoUrl
          }
        )
        parse_address(rep, official.address)
        reps.push(rep)
      else
       rep.update!(
          ocdid: ocdid_temp,
          title: title_temp,
          party: official.party,
          # photo: official.photoUrl
        )
        parse_address(rep, official.address)
        reps.push(rep)
      end
    end

    reps
  end

  # Helper method to parse address from Google Civic API response
  def self.parse_address(rep, api_address)
    first_address = api_address&.first
    rep.update!(
      address: first_address&.line1,
      city: first_address&.city,
      state: first_address&.state,
      zip: first_address&.zip
    )
  end

  serialize :address, JSON
  serialize :office, JSON
  serialize :photo, JSON
end

require 'google/apis/civicinfo_v2'

class SearchController < ApplicationController
  def search
    address = params[:address]
    service = Google::Apis::CivicinfoV2::CivicInfoService.new
    service.key = Rails.application.credentials[:GOOGLE_API_KEY]

    begin
      result = service.representative_info_by_address(address: address)
      @representatives = Representative.civic_api_to_representative_params(result) || []
      
      if @representatives.empty?
        flash.now[:alert] = "No information found for the given address."
      end
    rescue Google::Apis::Error => e
      puts "Google API Error: #{e.message}"
      flash.now[:alert] = "Error fetching information."
    end

    render 'representatives/search'
  end
end

# frozen_string_literal: true

class NewsItem < ApplicationRecord
  belongs_to :representative
  has_many :ratings, dependent: :delete_all
  validates :issue, presence: true

  def self.find_for(representative_id)
    NewsItem.find_by(
      representative_id: representative_id
    )
  end

  def self.find_five_articles(rep, rep_ID, issue, api_key)
    keyword = "#{rep}%20#{issue}"
    api_call = "https://newsapi.org/v2/everything?q=#{keyword}&apiKey=#{api_key}"
    api_parse = Net::HTTP.get_response(URI(api_call))
    response = JSON.parse(api_parse.body)
    if response['status'] != 'error'
      articles = response['articles']
      count = 0
      @fake_articles = []

      articles.each do |article|
        articleToPush = NewsItem.new( 
          title: article['title'],
          representative: @selected_representative,
          link: article['url'],
          description: article['description'],
          )
        @fake_articles.push(articleToPush)
        count += 1
        if count >= 5
          break
        end
        
      end
      @fake_articles
  end
end
end

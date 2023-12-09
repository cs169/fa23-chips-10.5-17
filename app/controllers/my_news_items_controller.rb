# frozen_string_literal: true

class MyNewsItemsController < SessionController
  before_action :set_representative
  before_action :set_representatives_list
  before_action :set_news_item, only: %i[edit update destroy]

  def new
    @news_item = NewsItem.new
  end

  def fake_articles
    @issue = params[:selected_issue]
    @selected_representative_id = params[:selected_representative]
    @selected_representative = Representative.find(params[:selected_representative])
    api_key = Rails.application.credentials[:NEWS_API_KEY]
    @fake_articles = NewsItem.find_five_articles(@representative.name, params[:representative_id],params[:selected_issue], api_key)
    render 'choose_fake_articles'
  end

  def add_article
    @news_item = NewsItem.create!(
      representative_id: params[:fake_article][:representative_id],
      issue: params[:fake_article][:issue],
      link: params[:fake_article][:link],
      title: params[:fake_article][:title],
      description: params[:fake_article][:description],
      rating: params[:rating],
    )
    selected_representative = Representative.find(params[:fake_article][:representative_id])
    if @news_item.save
      redirect_to representative_news_item_path(selected_representative, @news_item),
                  notice: 'News item was successfully created.'
    else
      render :new, error: 'An error occurred when creating the news item.'
    end
    # redirect_to representatives_path
  end
    

  def edit;  end

  def create
    @news_item = NewsItem.new(news_item_params)
    if @news_item.save
      redirect_to representative_news_item_path(@representative, @news_item),
                  notice: 'News item was successfully created.'
    else
      render :new, error: 'An error occurred when creating the news item.'
    end
  end

  def update
    if @news_item.update(news_item_params)
      redirect_to representative_news_item_path(@representative, @news_item),
                  notice: 'News item was successfully updated.'
    else
      render :edit, error: 'An error occurred when updating the news item.'
    end
  end

  def destroy
    @news_item.destroy
    redirect_to representative_news_items_path(@representative),
                notice: 'News was successfully destroyed.'
  end

  private

  def set_representative
    @representative = Representative.find(
      params[:representative_id]
    )
  end

  def set_representatives_list
    @representatives_list = Representative.all.map { |r| [r.name, r.id] }
  end

  def set_news_item
    @news_item = NewsItem.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def news_item_params
    params.require(:news_item).permit(:news, :title, :description, :link, :representative_id, :issue, :rating)
  end
end

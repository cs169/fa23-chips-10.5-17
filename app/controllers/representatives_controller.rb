# frozen_string_literal: true

class RepresentativesController < ApplicationController
  def index
    # @representatives = Representative.all
    @representative = Representative.find(params[:id])
    @additional_info = fetch_additional_info(@representative.official_id)
  end
end

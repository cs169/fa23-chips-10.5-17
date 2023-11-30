class RepresentativesController < ApplicationController
  def index
    @representatives = Representative.all
  end

  def show
    @representative = Representative.find(params[:id])

    # Check if @representative.address is not nil before accessing its attributes
    if @representative.address && @representative.city && @representative.state && @representative.zip
      @additional_info = {
        address: @representative.address,
        city: @representative.city,
        state: @representative.state,
        zip: @representative.zip,
        party: @representative.party,
        photo: @representative.photo
      }
    else
      @additional_info = {
        address: {
          street: 'N/A',
          city: 'N/A',
          state: 'N/A',
          zip: 'N/A'
        },
        party: @representative.party,
        photo: @representative.photo
      }
    end
  end
end

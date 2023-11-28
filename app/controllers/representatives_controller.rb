class RepresentativesController < ApplicationController
  def index
    @representatives = Representative.all
  end

  def show
    @representative = Representative.find(params[:id])

    # Check if @representative.address is not nil before accessing its attributes
    if @representative.address
      @additional_info = {
        address: {
          street: @representative.address[:street],
          city: @representative.address[:city],
          state: @representative.address[:state],
          zip: @representative.address[:zip]
        },
        party: @representative.party,
        photo: @representative.photo
      }
    else
      # Handle the case where address is nil (customize as needed)
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

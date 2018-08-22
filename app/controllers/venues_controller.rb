class VenuesController < ApplicationController
  before_action :set_venue, only: [:show]

  def index
    @venues = Venue.all
  end

  private

    def set_venue
      @venue = Venue.find_by_id(params[:id])
    end
end

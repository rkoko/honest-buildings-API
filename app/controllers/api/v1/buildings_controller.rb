#define constant here that calls Building.all
class Api::V1::BuildingsController < ApplicationController
  # before_action :authorize_user!, only: [:show]

  def index
    # render json: {buildings: Building.all}
    render json: Building.all
  end

  def addresses
    building_addresses = Building.all.pluck(:id, :street_address, :neighborhood).map{|id, street_address, neighborhood|{id: id, street_address: street_address, neighborhood: neighborhood}}
    render json: building_addresses
  end

  def show
      building = Building.find(params[:id])
      reviews = building.reviews
      building_mgmt = building.building_mgmt
      rating = building_mgmt.calculate_avg_rating.round(2)
      render json: {building: building, reviews: reviews, building_mgmt: building_mgmt, rating: rating}
  end
end

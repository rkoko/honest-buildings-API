class Api::V1::BuildingMgmtsController < ApplicationController
  # before_action :authorize_user!, only: [:show]

  def index
    render json: { building_mgmts: BuildingMgmt.all }
  end

  def create
    mgmt = BuildingMgmt.new(mgmt_params)
    mgmt.save
    if mgmt.save
      render json: { name: mgmt.name, status: 200 }
    else
      render json: { errors: mgmt.errors.full_messages }
  end
end


  def show
    building_mgmt = BuildingMgmt.find(params[:id])
    buildings = building_mgmt.buildings
    reviews = building_mgmt.reviews
    avg_rating = building_mgmt.calculate_avg_rating.round(2)
    render json: { building_mgmt: building_mgmt, avg_rating: avg_rating, buildings: buildings, reviews: reviews}
  end

  def find_mgmt
    BuildingMgmt.find_by(mgmtname: params[:mgmtname])
  end

  private

  def mgmt_params
    params.require(:building_mgmt).permit(:name)
  end
end

class Api::V1::BuildingsController < ApplicationController
  # before_action :authorize_user!, only: [:show]

  def index
    render json: Building.all
  end

  def addresses
    building_addresses = Building.all.pluck(:id, :street_address, :neighborhood).map{|id, street_address, neighborhood|{id: id, street_address: street_address, neighborhood: neighborhood}}
    render json: building_addresses
  end

  def show
      render json: Building.find(params[:id]), include: ['reviews', 'building_mgmt']
  end
end

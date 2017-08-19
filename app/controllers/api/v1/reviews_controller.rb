class Api::V1::ReviewsController < ApplicationController
# before_action :authorize_user!

  def index
    render json: Review.all
  end

  def show
    render json: Review.find(params[:id])
  end

  def create
    review = Review.new(review_params)
    review.user_id = current_user.id
    review.avg_rating = review.calculate_avg_rating
    review.save
    render json: review
  end


  private

  def review_params
    params.require(:review).permit( :upkeep_rating,
    :comms_rating,
    :quality_rating, :speedy_rating, :body, :comment, :building_mgmt_id, :building_id)
  end

end

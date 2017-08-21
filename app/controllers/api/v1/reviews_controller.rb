class Api::V1::ReviewsController < ApplicationController
# before_action :authorize_user!

  def index
    render json: Review.all.order('created_at DESC')
  end

  def show
    review = Review.find(params[:id])
    user = review.user
    render json: {review: review, user: user}

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

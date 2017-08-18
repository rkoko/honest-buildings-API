class BuildingMgmt < ApplicationRecord
  has_many :reviews
  has_many :buildings

  def calculate_avg_rating
    all_reviews = self.reviews
    all_reviews_sum = all_reviews.reduce(0) do |sum, review|
      sum += (review.comms_rating + review.quality_rating + review.speedy_rating + review.upkeep_rating)
    end
    review_avg = all_reviews.count > 0 ? all_reviews_sum.to_f/(all_reviews.count * 4).to_f : -1
  end

end

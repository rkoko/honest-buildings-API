class Review < ApplicationRecord
  belongs_to :user
  belongs_to :building_mgmt
  belongs_to :building

  def calculate_avg_rating
    review_avg = (self.comms_rating + self.quality_rating + self.speedy_rating + self.upkeep_rating)/4.0
  end

end

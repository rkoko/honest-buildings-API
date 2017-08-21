class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :comms_rating, :upkeep_rating, :speedy_rating, :quality_rating, :avg_rating, :body, :user

  belongs_to :user
end

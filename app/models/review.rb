class Review < ApplicationRecord
  belongs_to :user
  belongs_to :building_mgmt
  belongs_to :building
end

class Building < ApplicationRecord
  belongs_to :building_mgmt
  has_many :reviews



end

class BuildingSerializer < ActiveModel::Serializer
  attributes :id, :street_address, :neighborhood, :reviews

  belongs_to :building_mgmt
  has_many :reviews

end

class BuildingMgmtSerializer < ActiveModel::Serializer
  attributes :id, :name, :buildings
  has_many :buildings
end

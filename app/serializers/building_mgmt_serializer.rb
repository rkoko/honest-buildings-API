class BuildingMgmtSerializer < ActiveModel::Serializer
  attributes :id, :name, :details, :buildings
  # has_many :buildings
end

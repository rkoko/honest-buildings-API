class CreateBuildings < ActiveRecord::Migration[5.1]
  def change
    create_table :buildings do |t|
      t.string :street_address
      t.string :neighborhood
      t.string :state
      t.integer :zipcode
      t.belongs_to :building_mgmt, foreign_key: true

      t.timestamps
    end
  end
end

class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.integer :comms_rating
      t.integer :upkeep_rating
      t.integer :speedy_rating
      t.integer :quality_rating
      t.string :body
      t.string :comment
      t.belongs_to :user, foreign_key: true
      t.belongs_to :building_mgmt, foreign_key: true
      t.belongs_to :building, foreign_key: true

      t.timestamps
    end
  end
end

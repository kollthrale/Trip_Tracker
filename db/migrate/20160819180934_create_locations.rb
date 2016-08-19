class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.string :name, null: false
      t.string :category
      t.string :cost
      t.string :hours
      t.belongs_to :tripp 

      t.timestamps
    end
  end
end

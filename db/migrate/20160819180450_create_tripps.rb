class CreateTripps < ActiveRecord::Migration[5.0]
  def change
    create_table :tripps do |t|
      t.string :name, null: false
      t.boolean :vacation, default: true
      t.string :date, null: false
      t.integer :duration

      t.timestamps
    end
  end
end

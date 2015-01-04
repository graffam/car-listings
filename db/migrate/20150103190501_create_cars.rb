class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :name
      t.integer :manufacturer_id, null: false
      t.string :color, null: false
      t.integer :mileage, null: false
      t.integer :year, null: false
    end
  end
end

class AddDescriptionCars < ActiveRecord::Migration
  def change
    change_table :cars do |t|
      t.string :description
    end
  end
end

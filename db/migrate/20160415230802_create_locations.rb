class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.string :address
      t.float :regular_price

      t.timestamps null: false
    end
  end
end

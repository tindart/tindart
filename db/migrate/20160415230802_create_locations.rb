class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.string :address
      t.string :decription
      t.string :photo
      t.string :tickets
      t.string :opening_hours

      t.timestamps null: false
    end
  end
end

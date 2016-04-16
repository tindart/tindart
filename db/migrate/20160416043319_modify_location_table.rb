class ModifyLocationTable < ActiveRecord::Migration
  def change
    change_table :locations do |t|
      t.remove :regular_price
    end

    add_column :locations, :description, :text
    add_column :locations, :photo, :string
    add_column :locations, :tickets, :text
    add_column :locations, :opening_hours, :string
  end
end

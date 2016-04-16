class CreateLocationTag < ActiveRecord::Migration
  def change
    create_table :location_tags do |t|
      t.integer :tag_id
      t.integer :location_id
    end
  end
end

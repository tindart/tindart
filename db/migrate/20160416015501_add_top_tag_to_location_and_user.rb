class AddTopTagToLocationAndUser < ActiveRecord::Migration
  def change
    add_column :users, :top_tag, :string
    add_column :locations, :top_tag, :string
  end
end

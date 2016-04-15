class CreateEvent < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :user_id
      t.integer :art_piece_id
      t.string :event_type
      t.timestamps
    end
  end
end

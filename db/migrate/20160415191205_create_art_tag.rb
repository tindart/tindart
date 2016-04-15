class CreateArtTag < ActiveRecord::Migration
  def change
    create_table :art_tags do |t|
      t.integer :tag_id
      t.integer :art_piece_id
    end
  end
end

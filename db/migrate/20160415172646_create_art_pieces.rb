class CreateArtPieces < ActiveRecord::Migration
  def change
    create_table :art_pieces do |t|
      t.string :name
      t.string :genre
      t.text :link

      t.timestamps null: false
    end
  end
end

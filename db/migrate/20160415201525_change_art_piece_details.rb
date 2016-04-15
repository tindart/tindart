class ChangeArtPieceDetails < ActiveRecord::Migration
  def change
    change_table :art_pieces do |t|
      t.remove :genre
      t.string :author
    end

    rename_column :art_pieces, :name, :title
    rename_column :art_pieces, :link, :image_url
  end
end

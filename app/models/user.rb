class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events
  has_many :art_pieces, through: :events

  def unrated_art_pieces
    rated_art_pieces_ids = self.art_pieces.pluck(:id).uniq
    ArtPiece.where.not(id: rated_art_pieces_ids)
  end

end

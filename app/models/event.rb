class Event < ActiveRecord::Base

  belongs_to :user
  belongs_to :art_piece

  validates :art_piece_id, uniqueness: { scope: :user_id }

end

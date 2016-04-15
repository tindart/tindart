class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :events
  has_many :art_pieces, through: :events

end

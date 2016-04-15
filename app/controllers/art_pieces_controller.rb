class ArtPiecesController < ApplicationController
  before_action :authenticate_user!

  def show_art_piece
    if current_user.art_pieces.count > 5
      redirect_to your_match_path
    else
      @art_piece = current_user.unrated_art_pieces.sample
    end
  end

  def rate_art_piece
    Event.create(
      user_id:      current_user.id,
      art_piece_id: params[:id],
      event_type:   params[:type]
    )

    redirect_to show_art_piece_path
  end

  def match_place_and_user
    @user_match     = User.first
    @location_match = "Muzeum Cyckow"
    #TODO send notification to the other user (mailer)
  end
end

class ArtPiecesController < ApplicationController
  before_action :authenticate_user!

  def show_art_piece
    @art_piece = ArtPiece.order("RANDOM()").first
    # TODO remove seen ones
  end

  def rate_art_piece
    Event.create(
      user_id:      1, # TODO
      art_piece_id: params[:id],
      event_type:   params[:type]
    )

    redirect_to show_art_piece_path
  end
end

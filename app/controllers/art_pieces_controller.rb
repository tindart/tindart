class ArtPiecesController < ApplicationController
  before_action :authenticate_user!

  def show_art_piece
    if current_user.art_pieces.count > 10 #TODO
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
    top_tag = calculate_top_tags(1)

    @location = Location.where(top_tag: top_tag)
    @users    = User.where(top_tag: top_tag)
    # TODO send notification

  end

  private

    def calculate_top_tags(number_of_tags)
      art_pieces_ids = current_user.events.where(event_type: 'like').pluck(:art_piece_id)
      tags = ArtPiece.where(id: art_pieces_ids).includes(:tags).pluck(:name)
      tags_counts = Hash.new(0)
      tags.each { |tag| tags_counts[tag] += 1 }
      tags_counts.sort_by { |tag, count| count }.reverse.first(number_of_tags).to_h.keys
    end
end

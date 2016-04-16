class ArtPiecesController < ApplicationController
  before_action :authenticate_user!

  def show_art_piece
    if current_user.art_pieces.count > 2 #TODO
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
    top_tag    = calculate_top_tags(1)
    top_tag_id = Tag.where(name: top_tag).first.id

    @location = set_location(top_tag_id)
    @users    = User.where(top_tag: top_tag)
    # TODO send notification

  end

  private

    def calculate_top_tags(number_of_tags)
      art_pieces_ids = current_user.events.where(event_type: 'like').pluck(:art_piece_id)
      tags           = ArtPiece.where(id: art_pieces_ids).includes(:tags).pluck(:name)
      tags_counts    = Hash.new(0)
      tags.each { |tag| tags_counts[tag] += 1 }
      tags_counts.sort_by { |tag, count| count }.reverse.first(number_of_tags).to_h.keys

    end

    def set_location(tag_id)
      wspolczesne = [2, 8, 15, 16, 21, 26, 27, 28, 39]
      narodowe    = [4, 5, 11, 13, 19, 23, 25, 29, 30, 31, 33, 35, 37, 38]
      asp         = [1, 3, 6, 7, 9, 10, 12, 17, 18, 22, 24]

      if wspolczesne.include?(tag_id)
        Location.find(1)
      elsif narodowe.include?(tag_id)
        Location.find(3)
      else
        Location.find(2)
      end
    end
end

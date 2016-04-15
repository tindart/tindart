class ArtPiecesController < ApplicationController
  before_action :authenticate_user!

  def show_art_piece
    if current_user.art_pieces.count > 2
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
    top_tags_ids = calculate_top_tags(5)

    @user_match     = User.first
    @location_match = "Muzeum Cyckow"

    binding.pry


    #TODO send notification to the other user (mailer)
  end

  private

    def calculate_top_tags(number_of_tags)
      tags = current_user.art_pieces.includes(:tags).pluck(:id)
      # tags = ['cycki', 'cycki', 'aaa', 'aaa', 'aaa', 'aaa', 'bbb', 'bbb', 'bbb','bbb','bbb','bbb','bbb', 'cccc']
      tags_counts = Hash.new(0)
      tags.each { |tag| tags_counts[tag] += 1 }
      tags_counts.sort_by { |tag, count| count }.reverse.first(number_of_tags).to_h.keys
    end
end

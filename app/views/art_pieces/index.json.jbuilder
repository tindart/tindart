json.array!(@art_pieces) do |art_piece|
  json.extract! art_piece, :id, :name, :genre, :link
  json.url art_piece_url(art_piece, format: :json)
end

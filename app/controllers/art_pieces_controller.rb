class ArtPiecesController < ApplicationController
  before_action :authenticate_user!, :set_art_piece, only: [:show, :edit, :update, :destroy]

  # GET /art_pieces
  # GET /art_pieces.json
  def index
    @art_pieces = ArtPiece.all
  end

  # GET /art_pieces/1
  # GET /art_pieces/1.json
  def show
  end

  # GET /art_pieces/new
  def new
    @art_piece = ArtPiece.new
  end

  # GET /art_pieces/1/edit
  def edit
  end

  # POST /art_pieces
  # POST /art_pieces.json
  def create
    @art_piece = ArtPiece.new(art_piece_params)

    respond_to do |format|
      if @art_piece.save
        format.html { redirect_to @art_piece, notice: 'Art piece was successfully created.' }
        format.json { render :show, status: :created, location: @art_piece }
      else
        format.html { render :new }
        format.json { render json: @art_piece.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /art_pieces/1
  # PATCH/PUT /art_pieces/1.json
  def update
    respond_to do |format|
      if @art_piece.update(art_piece_params)
        format.html { redirect_to @art_piece, notice: 'Art piece was successfully updated.' }
        format.json { render :show, status: :ok, location: @art_piece }
      else
        format.html { render :edit }
        format.json { render json: @art_piece.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /art_pieces/1
  # DELETE /art_pieces/1.json
  def destroy
    @art_piece.destroy
    respond_to do |format|
      format.html { redirect_to art_pieces_url, notice: 'Art piece was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_art_piece
      @art_piece = ArtPiece.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def art_piece_params
      params.require(:art_piece).permit(:name, :genre, :link)
    end
end

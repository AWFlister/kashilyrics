class LyricsController < ApplicationController
  before_action :set_lyric, only: %i[ show update destroy ]

  # GET /lyrics
  def index
    @lyrics = params[:song_id].blank? ? Lyric.all : Lyric.where(song_id: params[:song_id])

    render json: @lyrics
  end

  # GET /lyrics/1
  def show
    render json: @lyric
  end

  # POST /lyrics
  def create
    @lyric = Lyric.new(lyric_params)

    if @lyric.save
      render json: @lyric, status: :created, location: @lyric
    else
      render json: @lyric.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /lyrics/1
  def update
    if @lyric.update(lyric_params)
      render json: @lyric
    else
      render json: @lyric.errors, status: :unprocessable_entity
    end
  end

  # DELETE /lyrics/1
  def destroy
    @lyric.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lyric
      @lyric = Lyric.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lyric_params
      params.require(:lyric).permit(:song_id, :language_id, :lyric_text)
    end
end

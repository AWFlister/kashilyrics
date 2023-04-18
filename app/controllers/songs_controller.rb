class SongsController < ApplicationController
  before_action :set_song, only: %i[ show update destroy ]

  # GET /songs
  def index
    @songs = Song.all

    render json: @songs
  end

  # GET /songs/1
  def show
    render json: @song
  end

  # POST /songs
  def create
    @song = Song.new song_params
    @song.artists << Artist.find params[:artist_id]
    @song.albums << Album.find params[:album_id]
    if @song.save
      song = @song.as_json
      song[:artist_ids] = @song.artists.map {|a| a.id}
      song[:album_ids] = @song.albums.map {|a| a.id}
      render json: song, status: :created, location: @song
    else
      render json: @song.errors, status: :unprocessable_entity
    end
    
  end

  # PATCH/PUT /songs/1
  def update
    if @song.update(song_params)
      render json: @song
    else
      render json: @song.errors, status: :unprocessable_entity
    end
  end

  # DELETE /songs/1
  def destroy
    @song.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_song
      @song = Song.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def song_params
      params.require(:song).permit(:title, :duration, :composer, :release_date, :language_id)
    end
end

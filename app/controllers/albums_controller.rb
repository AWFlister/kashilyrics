class AlbumsController < ApplicationController
  before_action :set_album, only: %i[ show update destroy ]

  # GET /albums
  def index
    @albums = Album.all

    render json: @albums
  end

  # GET /albums/1
  def show
    render json: @album
  end

  # POST /albums
  def create
    artists = params[:artist_ids].map {|id| Artist.find_by id: id}
    songs = params[:song_ids].map {|id| Song.find_by id: id}
    @album = Album.new album_params
    @album.artists += artists
    @album.songs += songs
    
    if @album.save
      render json: @album, status: :created, location: @album
    else
      render json: @album.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /albums/1
  def update
    @album.artists += params[:artist_ids].map {|id| Artist.find_by id: id}
    @album.artists = @album.artists.uniq
    @album.songs += params[:song_ids].map {|id| Song.find_by id: id}
    @album.songs = @album.songs.uniq

    if @album.update album_params
      render json: @album
    else
      render json: @album.errors, status: :unprocessable_entity
    end
  end

  # DELETE /albums/1
  def destroy
    @album.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_album
      @album = Album.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def album_params
      params.require(:album).permit(:title, :album_type, :release_date, :label)
    end
end

class BookmarksController < ApplicationController
  before_action :set_bookmark, only: %i[ show update destroy ]
  before_action :require_login, only: %i[ create update destroy ]

  # GET /bookmarks
  def index
    @bookmarks = params[:user_id].blank? ? Bookmark.all : User.find_by(id: params[:user_id]).bookmarks

    render json: @bookmarks
  end

  # GET /bookmarks/1
  def show
    render json: @bookmark
  end

  # POST /bookmarks
  def create
    @bookmark = Bookmark.new(bookmark_params)
    
    if @bookmark.save
      if params[:user_id].present?
        user = User.find_by id: params[:user_id]
        user.bookmarks << @bookmark
      end
      render json: @bookmark, status: :created, location: @bookmark
    else
      render json: @bookmark.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /bookmarks/1
  def update
    if @bookmark.update(bookmark_params)
      render json: @bookmark
    else
      render json: @bookmark.errors, status: :unprocessable_entity
    end
  end

  # DELETE /bookmarks/1
  def destroy
    @bookmark.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bookmark
      @bookmark = Bookmark.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bookmark_params
      params.require(:bookmark).permit(:user_id, :bookmarkable_id, :bookmarkable_type)
    end
end

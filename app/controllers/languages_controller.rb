class LanguagesController < ApplicationController
  before_action :set_language, only: %i[ show update destroy ]
  before_action :require_login, only: %i[ create update destroy ]

  # GET /languages
  def index
    @languages = Language.all

    render json: @languages
  end

  # GET /languages/1
  def show
    render json: @language
  end

  # POST /languages
  def create
    @language = Language.new(language_params)

    if @language.save
      render json: @language, status: :created, location: @language
    else
      render json: @language.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /languages/1
  def update
    if @language.lang_code == "ZZ"
      render json: {}, status: :forbidden      
    elsif @language.update(language_params)
      render json: @language
    else
      render json: @language.errors, status: :unprocessable_entity
    end
  end

  # DELETE /languages/1
  def destroy
    if @language.lang_code == "ZZ"
      render json: {}, status: :forbidden
    else
      songs = Song.where language: @language
      lyrics = Lyric.where language: @language

      zz = Language.find_by lang_code: "ZZ"
      (songs + lyrics).each do |s|
        s.language = zz
        s.save
      end
      @language.destroy
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_language
      @language = Language.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def language_params
      params.require(:language).permit(:lang_code, :lang_name)
    end
end

require "test_helper"

class SongsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @song = songs(:album1song1)
    @language = languages(:en)
    @artist = artists(:artist4)
    @album = @artist.albums.first
  end

  test "should get index" do
    get songs_url, as: :json
    assert_response :success
  end

  test "should create song" do
    login
    assert_difference("Song.count") do
      post songs_url, params: { artist_id: @artist.id,
                                album_id: @album.id,
                                song: { composer: @song.composer, 
                                        duration: @song.duration,
                                        language_id: @language.id,
                                        release_date: @song.release_date, 
                                        title: @song.title } }, as: :json
    end

    assert_response :created
  end

  test "should show song" do
    get song_url(@song), as: :json
    assert_response :success
  end

  test "should update song" do
    login
    patch song_url(@song), params: { song: { composer: @song.composer, duration: @song.duration, release_date: @song.release_date, title: @song.title } }, as: :json
    assert_response :success
  end

  test "should destroy song" do
    login
    assert_difference("Song.count", -1) do
      delete song_url(@song), as: :json
    end

    assert_response :no_content
  end
end

require "test_helper"

class AlbumsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @album = albums(:album1)
  end

  test "should get index" do
    get albums_url, as: :json
    assert_response :success
  end

  test "should create album" do
    assert_difference("Album.count") do
      post albums_url, params: { 
        artist_ids: [805413029, 688451865],
        song_ids: [1064428692, 867194838, 552388488],
        album: { album_type: @album.album_type, label: @album.label, release_date: @album.release_date, title: @album.title } }, as: :json
    end

    assert_response :created
  end

  test "should show album" do
    get album_url(@album), as: :json
    assert_response :success
  end

  test "should update album" do
    patch album_url(@album), params: { 
      artist_ids: [504349070],
      song_ids: [],
      album: { album_type: @album.album_type, label: @album.label, release_date: @album.release_date, title: @album.title } 
    }, as: :json
  end

  test "should destroy album" do
    assert_difference("Album.count", -1) do
      delete album_url(@album), as: :json
    end

    assert_response :no_content
  end
end

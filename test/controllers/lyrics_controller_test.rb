require "test_helper"

class LyricsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lyric = lyrics(:album1song1lyric1)
  end

  test "should get index" do
    get lyrics_url, as: :json
    assert_response :success
  end

  test "should create lyric" do
    login
    assert_difference("Lyric.count") do
      post lyrics_url, params: { lyric: { language_id: @lyric.language_id, lyric_text: @lyric.lyric_text, song_id: @lyric.song_id } }, as: :json
    end

    assert_response :created
  end

  test "should show lyric" do
    get lyric_url(@lyric), as: :json
    assert_response :success
  end

  test "should update lyric" do
    login
    patch lyric_url(@lyric), params: { lyric: { language_id: @lyric.language_id, lyric_text: @lyric.lyric_text, song_id: @lyric.song_id } }, as: :json
    assert_response :success
  end

  test "should destroy lyric" do
    login
    assert_difference("Lyric.count", -1) do
      delete lyric_url(@lyric), as: :json
    end

    assert_response :no_content
  end
end

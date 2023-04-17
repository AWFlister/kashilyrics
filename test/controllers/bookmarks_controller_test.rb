require "test_helper"

class BookmarksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bookmark = bookmarks(:bm11)
  end

  test "should get index" do
    get bookmarks_url, as: :json
    assert_response :success
  end

  test "should create bookmark" do
    assert_difference("Bookmark.count") do
      post bookmarks_url, params: { bookmark: { bookmarkable_id: @bookmark.bookmarkable_id, bookmarkable_type: @bookmark.bookmarkable_type, user_id: @bookmark.user_id } }, as: :json
    end

    assert_response :created
  end

  test "should show bookmark" do
    get bookmark_url(@bookmark), as: :json
    assert_response :success
  end

  test "should update bookmark" do
    patch bookmark_url(@bookmark), params: { bookmark: { bookmarkable_id: @bookmark.bookmarkable_id, bookmarkable_type: @bookmark.bookmarkable_type, user_id: @bookmark.user_id } }, as: :json
    assert_response :success
  end

  test "should destroy bookmark" do
    assert_difference("Bookmark.count", -1) do
      delete bookmark_url(@bookmark), as: :json
    end

    assert_response :no_content
  end
end

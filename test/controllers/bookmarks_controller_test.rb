require "test_helper"

class BookmarksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bookmark = bookmarks(:bm11)
  end

  test "should get bookmarks" do
    get bookmarks_url, as: :json
    assert_response :success
  end

  test "should get bookmarks of a user" do
    user = User.find_by email: 'user1@mail.com'
    get user_bookmarks_url(user)
    assert_response :success
  end

  test "should not create bookmark without login" do
    assert_no_difference("Bookmark.count") do
      post bookmarks_url, params: { bookmark: { bookmarkable_id: @bookmark.bookmarkable_id, bookmarkable_type: @bookmark.bookmarkable_type, user_id: @bookmark.user_id } }, as: :json
    end

    assert_response :forbidden
  end

  test "should create bookmark for a user" do
    login
    assert_difference("Bookmark.count") do
      post bookmarks_url, params: { bookmark: { bookmarkable_id: 736794749, bookmarkable_type: 'Lyric', user_id: session[:user_id] } }, as: :json
    end

    assert_response :created
  end

  test "should not create duplicate bookmark for a user" do
    login
    assert_no_difference("Bookmark.count") do
      post bookmarks_url, params: { bookmark: { bookmarkable_id: @bookmark.bookmarkable_id, bookmarkable_type: @bookmark.bookmarkable_type, user_id: @bookmark.user_id } }, as: :json
    end
  end

  test "should show bookmark" do
    get bookmark_url(@bookmark), as: :json
    assert_response :success
  end

  test "should update bookmark" do
    login
    patch bookmark_url(@bookmark), params: { bookmark: { bookmarkable_id: @bookmark.bookmarkable_id, bookmarkable_type: @bookmark.bookmarkable_type, user_id: @bookmark.user_id } }, as: :json
    assert_response :success
  end

  test "should destroy bookmark" do
    login
    assert_difference("Bookmark.count", -1) do
      delete bookmark_url(@bookmark), as: :json
    end

    assert_response :no_content
  end
end

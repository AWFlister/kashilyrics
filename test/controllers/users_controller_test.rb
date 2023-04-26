require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:user1)
  end

  test "should get index" do
    get users_url, as: :json
    assert_response :success
  end

  test "should create user" do
    assert_difference("User.count") do
      post users_url, params: { user: { email: 'testuser@mail.com', 
                                        username: 'testuser', 
                                        password: 'testpass', 
                                        password_confirmation: 'testpass' } 
                              }, as: :json
    end

    assert_response :created
  end

  test "should show user" do
    get user_url(@user), as: :json
    assert_response :success
  end

  test "should update user" do
    login
    patch user_url(@user), params: { user: { email: @user.email, username: @user.username } }, as: :json
    assert_response :success
  end

  test "should destroy user" do
    login
    assert_difference("User.count", -1) do
      delete user_url(@user), as: :json
    end

    assert_response :no_content
  end
end

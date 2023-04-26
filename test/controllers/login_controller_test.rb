require "test_helper"

class LoginControllerTest < ActionDispatch::IntegrationTest
  test "should login user" do
    post login_url, params: {email: "user1@mail.com", password: "password1"}
    assert_response :success
    assert_not_nil session[:user_id]
  end
  
  test "should fail to login user from wrong password" do
    post login_url, params: {email: "user1@mail.com", password: "21309812"}
    assert_response :bad_request
    assert_nil session[:user_id]
  end

  test "should fail to login user from wrong email" do
    post login_url, params: {email: "213132@mail.com", password: "password1"}
    assert_response :bad_request
    assert_nil session[:user_id]
  end

  test "should fail to login user from wrong email and password" do
    post login_url, params: {email: "213132@mail.com", password: "21309812"}
    assert_response :bad_request
    assert_nil session[:user_id]
  end

  test "should logout user" do
    post logout_url
    assert_response :success
    assert_nil session[:user_id]
  end
end

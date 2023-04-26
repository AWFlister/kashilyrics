class LoginController < ApplicationController
  def login
    user = User.find_by email: params[:email]
    if(user.present? && user.authenticate(params[:password]))
      session[:user_id] = user.id
      render json: user
    else
      msg = {error: (user.present? ? "Invalid password" : "User not found")}
      render json: msg, status: :bad_request
    end
  end

  def logout
    session[:user_id] = nil
    render json: {}
  end
end

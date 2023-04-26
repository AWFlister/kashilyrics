class ApplicationController < ActionController::API
    private

    def require_login
        unless session[:user_id]
            render json: {message: "User not logged in"}, status: :forbidden
        end
    end
end

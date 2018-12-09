class ApplicationController < ActionController::Base

    def sign_in(user)
        cookies.permanent.signed[:user_id] = user.id #se implanta cookie
        @current_user = user #se crea variable de instancia con el usuario logueado
    end

    def sign_out
        cookies.delete(:user_id)
        @current_user = nil
    end

    private
    def signed_in?
        !current_user.nil?
    end

    helper_method :signed_in?

    def current_user
        @current_user ||= User.find(cookies.signed[:user_id]) if cookies.signed[:user_id]
    rescue ActiveRecord::RecordNotFound
    end

    helper_method :current_user

end

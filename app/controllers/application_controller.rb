class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :current_owner, :is_logged_in?, :authenticate_owner

    def current_owner
        Owner.find(session[:owner_id])
    end

    def is_logged_in?
        !current_owner.nil?
    end

    def authenticate_owner
        redirect_to '/' unless is_logged_in?
    end
end

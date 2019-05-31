class ApplicationController < ActionController::Base

  helper_method :current_user, :user_signed_in?, :redirect_if_signed_in

  
  private
    def redirect_if_signed_in
      redirect_to user_path(current_user) if user_signed_in?
    end

    def redirect_if_not_signed_in
      redirect_to root_path unless user_signed_in?
    end
  
    def current_user
      User.find_by_id(session[:user_id])
    end

    def user_signed_in?
      !!session[:user_id]
    end
end

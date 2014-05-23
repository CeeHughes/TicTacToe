class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_player
  # no CanCan gem yet...
  # rescue_from CanCan::AccessDenied do |exception|
  #   redirect_to login_path, alert: "Access denied"
  # end

  def current_player
    return @current_player ||= Player.find_by_id(session[:player_id])
  end

  def logged_in?
    !!current_player
  end

  private

  def authenticate
    unless logged_in?
      flash[:error] = "You must be logged to access this page"
      redirect_to root_path 
    end
  end
end
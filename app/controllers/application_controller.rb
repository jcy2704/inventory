class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :exists?

  def current_user
    @current_user ||= User.find(session[:current_user]['id']) if session[:current_user]
  end

  def logged_in?
    !!current_user
  end

  def exists?
    reset_session if current_user && User.find_by(id: session[:current_user]['id']).nil?
  end
end

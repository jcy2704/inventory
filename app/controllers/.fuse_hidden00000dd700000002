class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :exists?, :redirect_if_not_logged
  add_flash_types :succeeded

  before_action :current_cart

  def current_user
    @current_user ||= User.find(session[:current_user]['id']) if session[:current_user]
  end

  def logged_in?
    !!current_user
  end

  def exists?
    reset_session if session[:current_user] && User.find_by(id: session[:current_user]['id']).nil?
  end

  def redirect_if_not_logged
    exists?
    redirect_to login_path unless logged_in?
  end

  private

  def current_cart
    if session[:cart_id]
      cart = Cart.find_by(id: session[:cart_id])
      if cart.present?
        @current_cart = cart
      else
        session[:cart_id] = nil
      end
    end

    if session[:cart_id].nil?
      @current_cart = Cart.create
      session[:cart_id] = @current_cart.id
    end
  end
end

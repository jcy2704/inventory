class UsersController < ApplicationController
  include UsersHelper
  def index
    redirect_if_not_logged
  end

  def new
    if logged_in?
      redirect_to products_path
    else
      @user = User.new
    end
  end

  def create
    @user = User.new(user_params)
    @user.role.downcase!

    if @user.save
      new_current_user(@user)
      redirect_to products_path, notice: "Welcome, #{@user.username.capitalize}"
    else
      flash.now[:alert] = "#{errors_s(@user)[0]} #{errors_s(@user)[1]} #{errors_s(@user)[2]}‏‏‎ #{errors_s(@user)[3]}"
      render :new
    end
  end

  def edit
    exists?
    redirect_to products_path unless logged_in? && current_user.admin?
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    @user.role.downcase!
    if @user.save && @user == current_user
      new_current_user(@user)
      redirect_to products_path
    elsif @user.save
      redirect_to products_path
    end
  end

  def login
    exists?
    redirect_to products_path, notice: "#{current_user.username.capitalize}, you are already signed in." if logged_in?
  end

  def new_login
    @user = User.find_by(username: params[:username].downcase)
    if @user.nil?
      redirect_to login_path, alert: 'User does not exists.'
    else
      new_current_user(@user)
      redirect_to products_path, notice: 'Logged In Successfully.'
    end
  end

  def logout
    reset_session
    redirect_to login_path, notice: 'Logged Out Successfully'
  end
end

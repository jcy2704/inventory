# rubocop:disable Layout/LineLength

class UsersController < ApplicationController
  include UsersHelper
  def index
    redirect_to login_path unless logged_in? && exists?
  end

  def new
    if logged_in?
      redirect_to users_path
    else
      @user = User.new
    end
  end

  def create
    @user = User.new(user_params)
    @user.role.downcase!

    if @user.save
      new_current_user(@user)
      redirect_to users_path, notice: "Welcome, #{@user.username.capitalize}"
    else
      redirect_to new_user_path, alert: "#{errors_s(@user)[0]} #{errors_s(@user)[1]} #{errors_s(@user)[2]}‏‏‎ #{errors_s(@user)[3]}"
    end
  end

  def edit
    exists?
    redirect_to users_path unless logged_in? && current_user.role == 'admin'
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    @user.role.downcase!
    if @user.save && @user == current_user
      new_current_user(@user)
      redirect_to users_path
    elsif @user.save
      redirect_to users_path
    end
  end

  def login
    exists?
    redirect_to users_path, notice: "#{current_user.username.capitalize}, you are already signed in." if logged_in?
  end

  def new_login
    @user = User.find_by(username: params[:username])
    if @user.nil?
      redirect_to login_path, alert: 'User does not exists.'
    else
      new_current_user(@user)
      redirect_to users_path, notice: 'Logged In Successfully.'
    end
  end

  def logout
    reset_session
    redirect_to login_path, notice: 'Logged Out Successfully'
  end
end

# rubocop:enable Layout/LineLength

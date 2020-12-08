class UsersController < ApplicationController
  include UsersHelper
  include ApplicationHelper

  def index
    redirect_if_not_logged
    redirect_to root_path unless current_user.admin?
    @users = User.order(username: :asc).includes(:avatar_attachment)
  end

  def new
    if !logged_in? || current_user.admin?
      @user = User.new
    elsif logged_in? && !current_user.admin?
      redirect_to products_path, notice: "#{current_user.username.capitalize}, you are already signed in."
    end
  end

  def create
    @user = User.new(user_params)
    @user.username.downcase!
    @user.role.downcase!

    if @user.save
      if logged_in?
        redirect_to users_path
      else
        new_current_user(@user)
        redirect_to products_path, succeeded: "Welcome, #{@user.username.capitalize}"
      end
    else
      flash.now[:alert] = "#{errors_s(@user)[0]} #{errors_s(@user)[1]} #{errors_s(@user)[2]}‏‏‎ #{errors_s(@user)[3]}"
      render :new
    end
  end

  def edit
    exists?
    @user = User.find(params[:id])
    if @user == current_user || current_user.admin?
      render :edit
    else
      redirect_to root_path
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    @user.role.downcase!
    if @user.save && @user == current_user
      new_current_user(@user)
      redirect_back(fallback_location: root_path)
    elsif @user.save
      redirect_back(fallback_location: root_path)
    end
  end

  def login
    exists?
    redirect_to root_path, notice: "#{current_user.username.capitalize}, you are already signed in." if logged_in?
  end

  def new_login
    @user = User.find_by(username: params[:username].downcase)
    if @user.nil?
      redirect_to login_path, alert: 'User does not exists.'
    else
      new_current_user(@user)
      redirect_to root_path, succeeded: 'Logged In Successfully.'
    end
  end

  def logout
    reset_session
    redirect_to login_path, succeeded: 'Logged Out Successfully'
  end

  def remove_avatar
    image = ActiveStorage::Attachment.find(params[:id])
    image.purge

    redirect_back(fallback_location: root_path)
  end
end

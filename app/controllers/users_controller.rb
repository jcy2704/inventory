class UsersController < ApplicationController
  include UsersHelper

  def new
    if logged_in?
      redirect_to users_path
    else
      @user = User.new
      @roles = %w[admin user]
    end
  end

  def create
    @user = User.new(user_params)

    if @user.save
      new_current_user(@user)
      redirect_to users_path
    else
      render :new
    end
  end

  def sign_in
    redirect_to users_path if current_user
  end

  def new_sign_in
    @user = User.find_by(username: params[:username])
    if @user.nil?
      redirect_to sign_in_path, notice: 'User does not exists.'
    else
      new_current_user(@user)
      redirect_to users_path
    end
  end

  def sign_out
    reset_session
    redirect_to sign_in_path
  end
end

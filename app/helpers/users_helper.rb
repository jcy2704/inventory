module UsersHelper
  def new_current_user(user)
    session[:current_user] = User.find(user.id)
    session[:current_user]
  end

  def user_params
    params.require(:user).permit(:username, :role)
  end
end

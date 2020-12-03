module UsersHelper
  def new_current_user(user)
    session[:current_user] = User.find(user.id)
    session[:current_user]
  end

  def user_params
    params.require(:user).permit(:username, :role)
  end

  def errors_s(user)
    user.errors.full_messages.each(&:to_s)
  end

  def break_the_lines(text)
    text.to_s.gsub(/\n/, '<br/>')
  end
end

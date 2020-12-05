module UsersHelper
  def new_current_user(user)
    session[:current_user] = User.find(user.id)
    session[:current_user]
  end

  def user_params
    params.require(:user).permit(:username, :role, :avatar)
  end

  def break_the_lines(text)
    text.to_s.gsub(/\n/, '<br/>')
  end

  def users_avatars(user)
    if user.avatar.attached?
      image_tag user.avatar, class: 'avatar-show'
    else
      image_tag 'default.jpg', class: 'avatar-show'
    end
  end

  def not_current_user(users)
    users.where('id != ?', current_user.id)
  end

  def new_user
    if logged_in?
      content_tag(:h1, 'Add User')
    else
      content_tag(:h1, 'Register')
    end
  end
end

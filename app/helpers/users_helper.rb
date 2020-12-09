module UsersHelper
  def new_current_user(user)
    session[:current_user] = User.find(user.id)
    session[:current_user]
  end

  def user_params
    params.require(:user).permit(:username, :role, :avatar)
  end

  def users_avatars(user, class_name)
    if user.avatar.attached?
      image_tag user.avatar, class: class_name
    else
      image_tag 'default.jpg', class: class_name
    end
  end

  def remove_avatar_btn(user)
    link_to 'Remove', remove_avatar_path(@user.avatar.id), method: :delete if user.avatar.attached?
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

  def role_form(user)
    return unless !logged_in? || current_user.admin?

    (user.label :role, 'Role', class: 'label') +
      (user.select :role, options_for_select(%w[Admin Employee], @user.role.capitalize), include_blank: '')
  end

  def avatar_form(user)
    return unless !logged_in? || @user == current_user

    (user.label :avatar, 'Avatar', class: 'label') +
      (user.file_field :avatar, class: 'avatar-field')
  end
end

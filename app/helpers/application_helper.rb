module ApplicationHelper
  def nav_right
    if logged_in?
      content_tag(:li, (link_to current_user.username, user_path(current_user.id)), class: 'my-user')
      content_tag(:li, (link_to 'Logout', logout_path), class: 'logout')
    else
      content_tag(:li, (link_to 'Login', login_path), class: 'login')
      content_tag(:li, (link_to 'Register', register_path), class: 'register')
    end
  end
end

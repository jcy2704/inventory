module ApplicationHelper
  def avatar_attached
    if current_user.avatar.attached?
      image_tag current_user.avatar, class: 'avatar'
    else
      image_tag 'default.svg', class: 'avatar'
    end
  end

  def only_admins
    return unless session[:current_user] && current_user.admin?

    link_to "#{icon('fas', 'users')} All Users".html_safe, users_path
  end

  def back_btn
    link_to icon('fas', 'chevron-left'), :back, class: 'back' if logged_in?
  end

  private

  def errors_s(entity)
    entity.errors.full_messages.each(&:to_s)
  end
end

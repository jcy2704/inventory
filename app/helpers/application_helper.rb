module ApplicationHelper
  def avatar_attached
    if current_user.avatar.attached?
      image_tag current_user.avatar, class: 'avatar'
    else
      image_tag 'default.jpg', class: 'avatar'
    end
  end

  def errors_s(entity)
    entity.errors.full_messages.each(&:to_s)
  end
end

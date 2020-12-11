module GroupsHelper
  def group_icon(group, class_name)
    if group.icon.attached?
      image_tag group.icon, class: class_name
    else
      image_tag 'category.svg', class: class_name
    end
  end

  def group_icon_remove(group)
    return unless group.icon.attached? && !group.icon.id.nil?

    link_to 'Remove', remove_icon_path(group.icon.id), method: :delete
  end

  def group_empty(group)
    return unless group == []

    '<div class="empty-center">'.html_safe +
      (image_tag 'empty_house.svg', class: 'empty-cart-img') +
      '</div>'.html_safe
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon, :user_id)
  end
end

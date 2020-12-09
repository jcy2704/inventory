module GroupsHelper
  def group_params
    params.require(:group).permit(:name, :icon, :user_id)
  end

  def group_icon(group, class_name)
    if group.icon.attached?
      image_tag group.icon, class: class_name
    else
      image_tag 'category.svg', class: class_name
    end
  end

  def group_icon_remove(group)
    return unless group.icon.attached?

    link_to 'Remove', remove_icon_path(group.icon.id), method: :delete
  end
end

module GroupsHelper
  def group_params
    params.require(:group).permit(:name, :icon)
  end

  def group_icon(group, class_name)
    if group.icon.attached?
      image_tag group.icon, class: class_name
    else
      image_tag 'category.svg', class: class_name
    end
  end
end

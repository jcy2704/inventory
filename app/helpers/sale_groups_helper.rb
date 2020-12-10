module SaleGroupsHelper
  def sale_g_params
    params.require(:sale_group).permit(:name, :icon, :user_id)
  end

  def sale_group_icon_remove(group)
    return unless group.icon.attached? && !group.icon.id.nil?

    link_to 'Remove', sale_remove_icon_path(group.icon.id), method: :delete
  end
end

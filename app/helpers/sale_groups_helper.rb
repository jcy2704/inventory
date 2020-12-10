module SaleGroupsHelper
  def sale_g_params
    params.require(:sale_group).permit(:name, :icon, :user_id)
  end

  def sale_group_icon_remove(group)
    return unless group.icon.attached? && !group.icon.id.nil?

    link_to 'Remove', sale_remove_icon_path(group.icon.id), method: :delete
  end

  def sale_group(sale)
    return if SaleGroup.nil?

    (sale.label 'Sale Group', class: 'label') +
      select_tag(
        :id,
        options_for_select(
          SaleGroup.all.collect { |group| [group.name, group.id] }
        ),
        include_blank: true
      )
  end

  private

  def sale_group_nil(sale)
    if !sale.sale_groups.nil?
      sale.sale_groups.id
    else
      sale.group
    end
  end
end

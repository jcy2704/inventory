module SaleGroupsHelper
  def sale_g_params
    params.require(:sale_group).permit(:name, :icon)
  end
end

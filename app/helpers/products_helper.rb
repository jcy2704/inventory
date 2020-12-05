module ProductsHelper
  def product_params
    params.require(:product).permit(:name, :price, :quantity, :upc, :group_id)
  end
end

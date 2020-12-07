module ProductsHelper
  def product_params
    params.require(:product).permit(:name, :price, :quantity, :upc, :group_id)
  end

  def options(product)
    if current_page?(delete_product_path)
      link_to 'Remove Product', product_delete_path(product), method: :delete
    else
      button_to "Add #{product.name} to Cart", line_items_path(product_id: product.id)
    end
  end

  def total_sales(product)
    sales = 0
    product.line_items.each do |p|
      sales += p.quantity
    end
    sales
  end
end

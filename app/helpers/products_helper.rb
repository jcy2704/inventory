module ProductsHelper
  def options(product)
    if product.quantity.zero?
      link_to 'OUT OF STOCK', edit_product_path(product.id), class: 'out-stock'
    else
      button_to "Add #{product.name.titleize} to Cart", line_items_path(product_id: product.id)
    end
  end

  def total_sales(product)
    sales = 0
    product.line_items.where(cart_id: nil).each do |p|
      sales += p.quantity
    end
    sales
  end

  def product_group_nil(product)
    if !product.group.nil?
      product.group.id
    else
      product.group
    end
  end

  def upc_nil(product)
    return if product.upc.nil?

    content_tag(:p, "UPC: #{product.upc}")
  end

  def group_nil(product)
    return if Group.nil?

    (product.label 'Group', class: 'label') +
      product.select(
        :group_id,
        options_for_select(
          Group.all.collect { |group| [group.name.titleize, group.id] },
          product_group_nil(@product)
        ),
        include_blank: ''
      )
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :quantity, :upc, :group_id)
  end
end

module SalesHelper
  def total_sale(product)
    sale = 0
    product.line_items.includes(:product).each do |item|
      sale += item.total_price
    end
    sale
  end

  def total_products(product)
    total = 0
    product.line_items.each do |item|
      total += item.quantity
    end
    total
  end

  def group_icon(group, class_name)
    if group.icon.attached?
      image_tag group.icon, class: class_name
    else
      image_tag 'category.svg', class: class_name
    end
  end
end

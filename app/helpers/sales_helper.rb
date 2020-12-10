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

  def sale_group_icon(sale, class_name)
    if sale.sale_groups.first.nil?
      image_tag 'category.svg', class: class_name
    elsif sale.sale_groups.first.icon.attached?
      image_tag sale.sale_groups.first.icon, class: class_name
    else
      image_tag 'category.svg', class: class_name
    end
  end

  def revenue(sale)
    revenue = 0
    sale.each do |s|
      revenue += total_sale(s)
    end
    revenue
  end

  def group?(sale)
    return if sale.sale_groups.first.nil?

    '<li>'.html_safe +
      sale.sale_groups.first.name.titleize +
      '</li>'.html_safe
  end
end

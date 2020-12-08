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
end

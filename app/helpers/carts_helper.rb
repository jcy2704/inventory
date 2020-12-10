module CartsHelper
  def empty_cart(cart)
    return unless cart.line_items != []

    '<div class="cart-btn">'.html_safe +
      (
        button_to 'Empty cart', cart_path(@current_cart), method: :delete, class: 'empty-cart', data: {
          confirm: 'Are you sure?'
        }
      ) +
      '</div>'.html_safe
  end

  def footer_cart(cart)
    return unless cart.line_items != []

    '<div class="flex footer"><div class="sub-total"><h3>Sub total: '.html_safe +
      number_to_currency(cart.sub_total).to_s +
      '</h3><div class="sell-btn">'.html_safe +
      (button_to 'Sell', sales_path, method: :post) +
      '</div></div></div>'.html_safe
  end
end

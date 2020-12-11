module CartsHelper
  def empty_cart(cart)
    if cart.line_items == []
      '<div class="empty-center">'.html_safe +
        (image_tag 'empty_cart.svg', class: 'empty-cart-img') +
        '</div>'.html_safe
    else
      '<div class="cart-btn">'.html_safe +
        (
          button_to 'Empty cart', cart_path(@current_cart), method: :delete, class: 'empty-cart', data: {
            confirm: 'Are you sure?'
          }
        ) +
        '</div>'.html_safe
    end
  end

  def footer_cart(cart)
    if cart.line_items == []
      '<div class="add-btn">'.html_safe +
        (link_to 'Add a Product', products_path) +
        '</div>'.html_safe
    else
      '<div class="add-btn">'.html_safe +
        (link_to 'Checkout', new_sale_path) +
        '</div>'.html_safe
    end
  end
end

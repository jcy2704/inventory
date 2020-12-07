class SalesController < ApplicationController
  def create
    @sale = Sale.new
    @sale.seller = current_user
    @current_cart.line_items.each do |item|
      @sale.line_items << item
      item.cart_id = nil
    end

    @sale.save

    @sale.line_items.each do |x|
      p = Product.find(x.product_id)
      p.update(quantity: p.quantity -= x.quantity)
    end

    Cart.destroy(session[:cart_id])
    session[:cart_id] = nil
    redirect_to root_path
  end
end

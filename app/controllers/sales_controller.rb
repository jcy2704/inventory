class SalesController < ApplicationController
  include ApplicationHelper

  def index
    redirect_if_not_logged
    @sales = Sale.order(created_at: :desc).includes(:seller, :line_items)
  end

  def new
    @sale = Sale.new
  end

  def create
    @sale = Sale.new
    @sale_group = SaleGroup.find(params[:id])
    @sale.seller = current_user
    @current_cart.line_items.each do |item|
      @sale.line_items << item
      item.cart_id = nil
    end

    @sale.save
    @sale.sale_groups << @sale_group
    @sale.line_items.each do |x|
      p = Product.find(x.product_id)
      p.update(quantity: p.quantity -= x.quantity)
    end

    Cart.find_by(id: session[:cart_id]).destroy
    session[:cart_id] = nil
    redirect_to root_path, succeeded: "Congratulations #{current_user.username.capitalize}, Sale Successful"
  end

  def show
    @sale = Sale.find(params[:id])
  end
end

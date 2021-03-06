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
    @sale.seller = current_user
    @current_cart.line_items.each do |item|
      @sale.line_items << item
      item.cart_id = nil
    end

    @sale.save
    if params[:id].present?
      @sale_group = SaleGroup.find(params[:id])
      @sale.sale_groups << @sale_group
    end
    @sale.line_items.each do |x|
      p = Product.find(x.product_id)
      p.update(quantity: p.quantity -= x.quantity)
    end

    Cart.find_by(id: session[:cart_id]).destroy
    session[:cart_id] = nil
    redirect_to sales_path, succeeded: "Congratulations #{current_user.username.titleize}, Sale Successful"
  end

  def show
    @sale = Sale.find(params[:id])
  end

  def individual
    @sales = Sale.not_grouped.order(created_at: :desc).includes(:line_items, :seller)
  end
end

class LineItemsController < ApplicationController
  def create
    product_chosen = Product.find(params[:product_id])
    current_cart = @current_cart

    if current_cart.products.include?(product_chosen)
      @line_item = current_cart.line_items.find_by(product_id: product_chosen)
      @line_item.quantity += 1
    else
      @line_item = LineItem.new
      @line_item.cart = current_cart
      @line_item.product = product_chosen
    end

    @line_item.save
    redirect_to cart_path(current_user), succeeded: "#{@line_item.product.name} Added to Cart"
  end

  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy
    redirect_to cart_path(@current_cart), succeeded: "#{@line_item.product.name} Removed Successfully"
  end

  def add_quantity
    @line_item = LineItem.find(params[:id])
    @line_item.quantity += 1
    @line_item.save
    redirect_to cart_path(@current_cart)
  end

  def reduce_quantity
    @line_item = LineItem.find(params[:id])
    @line_item.quantity -= 1 if @line_item.quantity > 1

    @line_item.save
    redirect_to cart_path(@current_cart)
  end

  private

  def line_item_params
    params.require(:line_item).permit(:quantity, :product_id, :cart_id)
  end
end

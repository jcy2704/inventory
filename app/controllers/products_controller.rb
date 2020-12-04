# rubocop:disable Layout/LineLength

class ProductsController < ApplicationController
  include ProductsHelper
  include ApplicationHelper

  def index
    redirect_if_not_logged
    @products = Product.all
  end

  def new
    redirect_if_not_logged
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path
    else
      flash.now[:alert] = "#{errors_s(@product)[0]} #{errors_s(@product)[1]} #{errors_s(@product)[2]}‏‏‎ #{errors_s(@product)[3]} #{errors_s(@product)[4]} #{errors_s(@product)[5]}"
      render :new
    end
  end

  def edit
    redirect_if_not_logged
    @product = Product.find(params[:id])
  end
end

# rubocop:enable Layout/LineLength

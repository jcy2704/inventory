class ProductsController < ApplicationController
  include ProductsHelper

  def index
    exists?
    redirect_to login_path unless logged_in?
    @products = Product.all
  end

  def new
    if logged_in?
      @product = Product.new
    else
      redirect_to login_path
    end
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end

  def edit
    exists?
    @product = Product.find(params[:id])
  end
end

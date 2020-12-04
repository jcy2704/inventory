class ProductsController < ApplicationController
  include ProductsHelper

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
    @groups = Group.all
    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end

  def edit
    redirect_if_not_logged
    @product = Product.find(params[:id])
  end
end

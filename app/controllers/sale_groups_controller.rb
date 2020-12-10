class SaleGroupsController < ApplicationController
  include SaleGroupsHelper

  def new
    @sale_group = SaleGroup.new
  end

  def create
    @sale_group = SaleGroup.new(sale_g_params)

    if @sale_group.save
      redire_to sale_groups_path, succeeded: "#{@sale_group.name} Created Successfully"
    else
      flash.now[:alert] = errors_s(@sale_group)[0].to_s
      render :new
    end
  end

  def edit
    @sale_group = SaleGroup.find(params[:id])
  end

  def update
    @sale_group = SaleGroup.find(params[:id])

    if @sale_group.update(sale_g_params)
      redirect_to sale_group_path(@sale_group.id), succeeded: "#{@sale_group.name} Updated Successfully"
    else
      flash.now[:alert] = "#{errors_s(@sale_group)[0]} #{errors_s(@sale_group)[1]} #{errors_s(@sale_group)[2]}‏‏‎"
      render :edit
    end
  end

  def show
    @sale_group = SaleGroup.find(params[:id])
    @sales = @sale_group.sales.order(name: :desc)
  end

  def remove_icon
    @icon = ActiveStorage::Attachment.find(params[:id])
    @icon.purge
    redirect_back(fallback_location: root_path)
  end
end

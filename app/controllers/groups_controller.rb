class GroupsController < ApplicationController
  include GroupsHelper

  def index
    redirect_if_not_logged
    @groups = Group.order(name: :asc).includes(:icon_attachment)
  end

  def new
    redirect_if_not_logged
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)

    if @group.save
      redirect_to groups_path, succeeded: "#{@group.name} Created Successfully"
    else
      render :new
    end
  end

  def edit
    redirect_if_not_logged

    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])

    if @group.update(group_params)
      redirect_to group_path(@group.id), succeeded: "#{@group.name} Updated Successfully"
    else
      render :edit
    end
  end

  def show
    @group = Group.find(params[:id])
    @products = @group.products.order(name: :asc)
  end

  def remove_icon
    @icon = ActiveStorage::Attachment.find(params[:id])
    @icon.purge
    redirect_back(fallback_location: root_path)
  end
end

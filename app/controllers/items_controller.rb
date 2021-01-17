class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :update]

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end

  def edit
  end

  def update
    @item.update(item_params)
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:content, :image)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end

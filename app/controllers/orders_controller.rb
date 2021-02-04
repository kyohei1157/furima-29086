class OrdersController < ApplicationController
  before_action :authenticate_user!, onry: [:create]
  before_action :ensure_correct_user, only: [:create]

  def index
    @order = Order.new
    @item = Item.find(params[:item_id])
  end

  def new
  end
  
  def create
    @order = Order.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end
  private

  def order_params
    params.require(:order).permit(:postal_cord,:prefecture_id, :municipality, :address, :phone_number, :card_number, :month, :year, :security_code).merge(order_id: params[:order])
  end

  def ensure_correct_user
    if current_user.id !=  @item.user_id
      redirect_to root_path
    end
  end
end
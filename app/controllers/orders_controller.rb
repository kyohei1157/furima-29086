class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index ,:create]
  before_action :set_item, only: [:index, :create]
  before_action :ensure_correct_user, only: [:index]
 
  def index
    @order = AddressForm.new
  end

  def new
  end
  
  def create
    @order = AddressForm.new(order_params)
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
    params.require(:address_form).permit(:postal_cord,:prefecture_id, :municipality, :address, :phone_number, :buildingname).merge(item_id: params[:item_id], token: params[:token],user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = "sk_test_b2b863bc1e32c797fc7a53a7" 
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def ensure_correct_user
    if current_user.id ==  @item.user_id || @item.order.present?
     redirect_to root_path
    end
  end
end
class OrdersController < ApplicationController
  before_action :authenticate_user!, onry: [:create]

  def index
    @order = AddressForm.new
    @item = Item.find(params[:item_id])
  end

  def new
  end
  
  def create
    @item = Item.find(params[:item_id])
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
    params.require(:address_form).permit(:postal_cord,:prefecture_id, :municipality, :address, :phone_number ).merge(item_id: params[:item_id], token: params[:token],user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = "sk_test_b2b863bc1e32c797fc7a53a7"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: order_params[:price],  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
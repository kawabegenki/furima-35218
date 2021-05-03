class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @history_order = HistoryOrder.new
  end

  def create
    @item = Item.find(params[:item_id])
    @history_order = HistoryOrder.new(history_order_params)

    if @history_order.valid?
      pay_item
      @history_order.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def history_order_params
    params.require(:history_order).permit(:postal_cord, :pay_from, :city, :addresses, :building, :phone_number, :user_id).merge(
      token: params[:token], user_id: current_user.id, item_id: params[:item_id]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: history_order_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end

class ItemsController < ApplicationController
  def index
    @item = Item.all
  end

  def new
    if user_signed_in?
      @item = Item.new
    else
      redirect_to user_session_path
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :price, :content, :category_id, :state_id, :charge_id, :from_id, :move_id,:image).merge(user_id: current_user.id)
  end
end

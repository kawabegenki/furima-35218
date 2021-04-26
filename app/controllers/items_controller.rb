class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @items = Item.all
  end

  def new
    # 登録順に並べる
    @item = Item.new.order(created_at: :desc)
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    # @item = Prototype.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:title, :price, :content, :category_id, :state_id, :charge_id, :from_id, :move_id,
                                 :image).merge(user_id: current_user.id)
  end
end

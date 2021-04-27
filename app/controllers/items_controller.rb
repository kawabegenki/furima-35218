class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]


  def index
    # 登録順に並べる
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
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
    @item = Item.find(params[:id])
  end

  def delete
  end

  def edit
  end

  private

  def item_params
    params.require(:item).permit(:title, :price, :content, :category_id, :state_id, :charge_id, :from_id, :move_id,
                                 :image).merge(user_id: current_user.id)
  end
end

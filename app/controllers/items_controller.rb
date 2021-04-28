class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :show,:update,:destroy]
  before_action :woop, only: [:edit,:update]

  def index
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
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  def edit
  end

  def update
    
    if @item.update(item_params) 
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :price, :content, :category_id, :state_id, :charge_id, :from_id, :move_id,:image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def woop 
    redirect_to action: :index unless @item.user == current_user 
  end
end

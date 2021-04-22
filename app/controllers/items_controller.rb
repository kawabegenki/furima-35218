class ItemsController < ApplicationController
  def index
    @item = Item.all
  end

  def new
    if  user_signed_in?
        @item = Item.new
    else
        redirect_to user_session_path
    end
  end


end

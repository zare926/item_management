class FavoriteController < ApplicationController
  def index
    item = Item.find(params[:item_id])
    if item.favorite == 0
      item.favorite = 1
      item.save
    end
    redirect_to root_path and return
  end

  def new
    item = Item.find(params[:item_id])
    if item.favorite == 1
      item.favorite = 0
      item.save
    end
    redirect_to root_path and return
  end

  def create
     
  end
end

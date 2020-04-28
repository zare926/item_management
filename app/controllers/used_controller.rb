class UsedController < ApplicationController
  
  def index
    item = Item.find(params[:item_id])
    if item.status == "unused"
      item.touch
      item.status = "used"
      item.save
    end
    redirect_to root_path and return
  end

  def new
    item = Item.find(params[:item_id])
    if item.status == "used"
      item.status = "unused"
      item.save
    end
    redirect_to root_path and return
  end

  def create
    
  end

end

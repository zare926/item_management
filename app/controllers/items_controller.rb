class ItemsController < ApplicationController

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path and return
    else
      redirect_to new_item_path and return
    end
  end

  def edit
  end

  def update
  end

  def show
  end

  def destroy
  end
  
  private

  def item_params
    params.require(:item).permit(:name,:text,:weather,:image).merge(user_id: current_user.id)
  end
end

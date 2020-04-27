class ItemsController < ApplicationController

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
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
    params.require(:item).permit(:name,:weather,:image,:text).merge(:user_id current_user.id)
  end
end

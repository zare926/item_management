class ItemsController < ApplicationController
  before_action :timepass,only:[:index]

  def index
    if user_signed_in?
      @items = Item.where(user_id: current_user.id).order("created_at DESC")
    end
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

  def timepass
    time = Time.now
    used = Item.all
    used.each do |u|
      if u.updated_at + u.limit.minutes < time && u.status =="used"
        u.status = "unused"
        u.save
      end
    end 
  end
  
  private

  def item_params
    params.require(:item).permit(:name,:text,:weather,:image).merge(user_id: current_user.id)
  end

  def set_params
    @item = Item.find(params[:id])
  end

end

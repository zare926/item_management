class ItemsController < ApplicationController
  before_action :timepass,only:[:index]
  before_action :set_params,only:[:show,:edit,:destroy]
  before_action :user_params,only:[:show,:edit]
  before_action :move_to_index, except: [:index,:show]
  before_action :move_to_edit, only: [:edit]
  def index
    if user_signed_in?
      @items = Item.where(user_id: current_user.id).order("created_at DESC")
      @items_favorite = @items.where(favorite: 1)
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
    item = Item.find(params[:id])
    item.update(item_params)
    if item.save
      redirect_to root_path and return
    else
      redirect_to new_item_path and return
    end
  end

  def show
    @comment = Comment.new
    @comments = @item.comments.includes(:item).order("created_at DESC")
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
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

  def search
    @users = User.search(params[:keyword])
  end
  
  private

  def item_params
    params.require(:item).permit(:name,:text,:weather,:image,:size).merge(user_id: current_user.id)
  end

  def set_params
    @item = Item.find(params[:id])
  end

  def user_params
    @user = @item.user
    @item_number = @item.user.items
    @item_favorite = @item_number.where(favorite:1)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def move_to_edit
    @item = Item.find(params[:id])
    if @item.status == "used" or @item.user_id != current_user.id
      redirect_to action: :index
    end
  end
end

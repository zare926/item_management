class Users::SearchesController < ApplicationController
  def index
    @users = User.search(params[:keyword]).page(params[:page]).per(5)
    if user_signed_in?
      @items = Item.where(user_id: current_user.id).order("created_at DESC")
      @items_favorite = Item.where(favorite: 1)
    end
  end
end

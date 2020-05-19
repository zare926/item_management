class UsersController < ApplicationController

  def index
  end

  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      redirect_to root_path and return
    else
      redirect_to new_user_registration_path and return
    end
  end

  def edit
  end

  def update
  end

  def show
    @user = User.find(params[:id])
    @items = @user.items
    @items_favorite = @items.where(favorite:1)
  end

  def search
    @users = User.search(params[:keyword])
  end

  private

  def user_params
    params.require(:user).permit(:nickname,:email,:encrypted_password,:mysize,:iconimage)
  end
end
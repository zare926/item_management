class UsersController < ApplicationController

  def index
  end

  def new
  end

  def create
    user = User.new
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
  end

end
class Users::SearchesController < ApplicationController
  def index
    @users = User.search(params[:keyword])
  end
end

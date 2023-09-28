class UsersController < ApplicationController
  def index
    @user_lists = User.all
  end

  def show
    @user_lists = User.find(params[:id])
  end
end

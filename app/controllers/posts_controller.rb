class PostsController < ApplicationController
  def index
    @user_lists = User.find(params[:user_id])
    @posts = @user_lists.posts
  end

  def show
    @post = Post.find(params[:id])
  end
end

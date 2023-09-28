class LikesController < ApplicationController
  before_action :current_user

  def new
    @like = Like.new
  end

  def create
    @post = Post.find(params[:post_id])
    @like = Like.new(user_id: current_user.id, post_id: @post.id)

    if @like.save
      redirect_to user_post_path(@post.author, @post), notice: 'You liked this post!'
    else
      redirect_to user_post_path(@post.author, @post), alert: 'Unable to like this post.'
    end
  end
end

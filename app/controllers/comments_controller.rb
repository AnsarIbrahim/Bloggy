class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @post = Post.find(params[:post_id])
    @comment.post_id = @post.id

    if @comment.save
      redirect_to user_post_path(user_id: @post.author_id, id: @post.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end

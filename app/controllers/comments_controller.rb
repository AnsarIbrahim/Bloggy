class CommentsController < ApplicationController

  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments
    respond_to do |format|
      format.html { render "index" }
      format.json { render json: @comments }
    end
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @post = Post.find(params[:post_id])
    @comment.post_id = @post.id

    if @comment.save
      respond_to do |format|
        format.html { redirect_to user_post_path(user_id: @post.author_id, id: @post.id) }
        format.json { render json: { message: "Comment Add" }, status: :created }
      end
    else
      respond_to do |format|
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: { message: "Comment Not Add" }, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @post = Post.find(params[:post_id])
    @comment.destroy
    redirect_to user_post_path(user_id: @post.author_id, id: @post.id)
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end

class PostsController < ApplicationController
  def index
    @user_lists = User.includes(posts: :comments).find(params[:user_id])
    @posts = @user_lists.posts.paginate(page: params[:page], per_page: 3)

    respond_to do |format|
      format.html { render 'index' }
      format.json { render json: @posts }
    end
  end

  def show
    @post = Post.find(params[:id])
    @count = @post.comment_counter
  end

  def new
    @user = User.find(params[:user_id])
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user

    if @post.save
      redirect_to user_post_path(user_id: current_user.id, id: @post.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.likes.destroy_all
    @post.comments.destroy_all
    @post.destroy
    redirect_to user_posts_path(user_id: current_user.id)
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end

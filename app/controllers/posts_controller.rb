class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(author_id: params[:user_id]).paginate(page: params[:page], per_page: 5)
  end

  def new
    @user = @current_user
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author = @current_user

    if @post.save
      puts "Post saved correctly"
      flash[:success] = 'Post was successfully created.'
      redirect_to user_post_path(@current_user, @post)
    else
      render :new
    end
  end

  def like
    @post = Post.find(params[:id])
    Like.new(user: @current_user, post: @post)
    redirect_to user_post_path(@current_user, @post), notice: 'You liked this post.'
  end

  def unlike
    @post = Post.find(params[:id])
    like = @post.likes.find_by(user: @current_user, post: @post)
    like.destroy if like
    redirect_to user_post_path(@current_user, @post), notice: 'You unliked this post.'
  end

  def show
    @user = @current_user
    @post = Post.find(params[:id])
    @comments = Comment.where(post_id: params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end

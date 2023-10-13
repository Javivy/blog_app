class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(author_id: params[:user_id]).paginate(page: params[:page], per_page: 5)
  end

  def show
    @post = Post.find(params[:id])
    @comments = Comment.where(post_id: params[:id])
  end
end

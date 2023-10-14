class CommentsController < ApplicationController
  def new
    @user = @current_user
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(post_params)
    @comment.post = @post
    @comment.user = @current_user

    if @comment.save
      puts "Comment saved correctly"
      flash[:success] = 'Comment was successfully created.'
      redirect_to user_post_path(@current_user, @post)
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:comment).permit(:text)
  end
end

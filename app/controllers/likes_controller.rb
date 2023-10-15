class LikesController < ApplicationController
  def new
    @like = Like.new
  end

  def create
    @like = Like.new(like_params)
    @like.user = current_user
    if @like.save
      redirect_to user_post_path(id: params.require(:post_id), user_id: params.require(:user_id))
    else
      render 'new'
    end
  end

  private

  def like_params
    params.require(:like).permit(:post_id)
  end
end
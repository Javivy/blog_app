class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @recent_posts = User.find(params[:id]).recent_posts
  end
end

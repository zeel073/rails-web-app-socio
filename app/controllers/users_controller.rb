class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.search(params[:term])
    respond_to :js
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.includes(:likes, :comments)
    @saved = Post.joins(:bookmarks).where("bookmarks.user_id=?", current_user.id).
      includes(:likes, :comments) if @user == current_user
  end
end

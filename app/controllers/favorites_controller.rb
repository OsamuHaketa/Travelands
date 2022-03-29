class FavoritesController < ApplicationController
before_action :authenticate_user!

  def index
    @user = current_user
    @favorites = @user.favorites.page(params[:page]).per(5)
  end

  def create
    @post = Post.find(params[:post_id])
    @favorite = @post.favorites.new(user_id: current_user.id)
    if @favorite.save
    else
      redirect_to request.referer
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @favorite = @post.favorites.find_by(user_id: current_user.id)
    if @favorite.present?
      @favorite.destroy
    else
      redirect_to request.referer
    end
  end
end
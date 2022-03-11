class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to root_path
    else
      redirect_to request.referer
    end
  end

  private

  def post_params
    params.require(:post).permit(:post_image, :user_id, :body, :title)
  end
end

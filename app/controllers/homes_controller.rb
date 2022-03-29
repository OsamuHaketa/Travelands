class HomesController < ApplicationController
  def top
    @posts = Post.all.order(created_at: :desc).page(params[:page]).per(5)
    @tag_list = Tag.all.sort {|a,b| b.posts.size <=> a.posts.size}
  end
end

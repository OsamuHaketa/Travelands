class HomesController < ApplicationController
  def top
    @posts = Post.all.order(created_at: :desc).limit(8)
    @tag_list = Tag.all
  end
end

class HomesController < ApplicationController
  def top
    @posts = Post.all
    @tag_list = Tag.all
  end
end

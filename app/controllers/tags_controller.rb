class TagsController < ApplicationController
  def index
    @tag_list = Tag.all.sort {|a,b| b.posts.size <=> a.posts.size}
  end
end
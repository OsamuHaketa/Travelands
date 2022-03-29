class TagsController < ApplicationController
  def index
    @tag_list = Tag.all.search(params[:search])
  end
end
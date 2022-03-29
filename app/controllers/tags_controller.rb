class TagsController < ApplicationController
  def index
    @tag_list = Tag.all.search(params[:search]).page(params[:page]).per(30)
  end
end
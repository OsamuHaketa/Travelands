class PostsController < ApplicationController
before_action :authenticate_user!, only: [:new,:create,:index,:edit,:destroy,:update]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    tag_list = params[:post][:tagname].delete(' ').delete('　').split(',')
    if @post.save
      @post.save_tags(tag_list)
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
    @tags = @post.tags
  end

  def index
  end

  def edit
    @post = Post.find(params[:id])
    @tag_list =@post.tags.pluck(:tagname).join(",")
  end

  def update
    post = Post.find(params[:id])
    tag_list = params[:post][:tagname].delete(' ').delete('　').split(',')
    if post.update(post_params)
      post.save_tags(tag_list)
      redirect_to post_path(post)
    else
      redirect_to request.referer
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to user_path(current_user)
  end

  def search
    @tag_list = Tag.all
    @tag = Tag.find(params[:tag_id])
    @posts = @tag.posts.all
  end

  private

  def post_params
    params.require(:post).permit(:post_image, :user_id, :body, :title, :star)
  end
  
end

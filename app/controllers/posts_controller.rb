class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    tag_list = params[:post][:tagname].delete(' ').delete('　').split(',')
    if @post.save
      @post.save_posts(tag_list)
      redirect_to root_path
    else
      redirect_to request.referer
    end
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
  end
    
  def index
    if params[:tag_id]
      @tag_list = Tag.all
      @tag = Tag.find(params[:tag_id])
      @posts = @tag.blogs.published.order(time: "DESC").page(params[:page]).per(10)
      @posts_side = Post.published.order(time: "DESC")
    else
      @tag_list = Tag.all
      @posts = Post.published.order(time: "DESC").page(params[:page]).per(10)
      @posts_side = Post.published.order(time: "DESC")
    end
    respond_to do |format|
      format.html
      format.rss { render :layout => false }
    end
  end

  def edit
    @post = current_user.posts.find(params[:id])
    @tag_list = @post.tags.pluck(:tagname).join(',')
  end
  
  def update
    @post = current_user.posts.find(params[:id])
    tag_list = params[:post][:tagname].delete(' ').delete('　').split(',')
    if @post.update(post_params)
      @post.save_posts(tag_list)
      redirect_to root_path
    else
      render :edit
    end
  end
  
  private

  def post_params
    params.require(:post).permit(:post_image, :user_id, :body, :title, :star)
  end
end

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
    @post_tags = @post.tags
  end
    
  def index
    
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
      redirect_to _path
    else
      render :edit
    end
  end
  
  def search
    @tag_list = Tag.all  #こっちの投稿一覧表示ページでも全てのタグを表示するために、タグを全取得
    @tag = Tag.find(params[:tag_id])  #クリックしたタグを取得
    @posts = @tag.posts.all           #クリックしたタグに紐付けられた投稿を全て表示
  end
  
  private

  def post_params
    params.require(:post).permit(:post_image, :user_id, :body, :title, :star)
  end
end

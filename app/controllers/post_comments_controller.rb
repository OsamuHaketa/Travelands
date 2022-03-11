class PostCommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.post_comments.new(post_comment_params)
    @comment.post_id = @post.id
    if @comment.save
      redirect_to root_path
    else
      redirect_to request.referer
    end
  end

  def edit

  end

  def destroy

  end

private

  def post_comment_params
    params.require(:post_comment).permit(:user_id, :post_id, :comment)
  end

end

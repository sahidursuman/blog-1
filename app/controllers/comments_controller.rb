class CommentsController < ApplicationController

  def index
    post = Post.find(params[:post_id])
    @comments = post.comments.ordered#.page(params[:page]).per(10)
  end

  def create
    @comment = Comment.new(safe_params)
    if @comment.save
      respond_to do |format|
        format.json
      end
    else
      render nothing: true, status: 400
    end
  end

  private
  def safe_params
    params.require(:comment).permit(:post_id, :content)
  end

end

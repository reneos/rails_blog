class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.post = @post
    authorize @comment
    if @comment.save
      redirect_to post_path(@comment.post, anchor: "comment-#{@comment.id}")
    else
      render 'posts/show'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    authorize @comment
    @comment.destroy
    redirect_to post_path(@comment.post)
  end

  private
  def comment_params
    params.require(:comment).permit(:name, :content)
  end
end

class PostsController < ApplicationController
  before_action :find_post, only: [:edit]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to edit_post_path(@post)
    else
      render :new
    end
  end

  def edit
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(
      :title,
      :is_published,
      :publish_date,
      :content
    )
  end
end

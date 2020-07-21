class PostsController < ApplicationController
  before_action :find_post, only: [:edit, :update, :show, :destroy, :publish, :unpublish]
  skip_before_action :authenticate_user!, only: [:index]

  def index
    if params[:q]
      @posts = Post.search(params[:q]).paginate(:page => params[:page])
      flash.now[:notice] = "Sorry, no results found for '#{params[:q]}'" if @posts.empty?
    else
      @posts = Post.published.paginate(:page => params[:page])
    end
    @posts = @posts.tagged_with(params[:tag]) if params[:tag]
  end

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

  def update
    if @post.update(post_params)
      redirect_to edit_post_path(@post)
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @post.destroy
    flash[:notice] = "Post entitled '#{@post.title}' has been deleted."
    redirect_to dashboard_path
  end

  def publish
    @post.is_published = true
    @post.save
    redirect_to post_path(@post)
  end

  def unpublish
    @post.is_published = false
    @post.save
    redirect_to post_path(@post)
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
      :content,
      :tag_list
    )
  end
end

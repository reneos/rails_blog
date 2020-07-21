class PostsController < ApplicationController
  before_action :find_post, only: [:edit, :update, :show, :destroy, :publish, :unpublish]
  before_action :set_tags, only: [:new, :edit]
  skip_before_action :authenticate_user!, only: [:index]

  def index
    if params[:q]
      @posts = policy_scope(Post).search(params[:q]).paginate(:page => params[:page])
    else
      @posts = policy_scope(Post).paginate(:page => params[:page])
    end
    @posts = @posts.tagged_with(params[:tag].split(' '), any: true) if params[:tag]
  end

  def new
    @post = Post.new
    authorize @post
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    authorize @post
    if @post.save
      redirect_to edit_post_path(@post)
    else
      render :new
    end
  end

  def edit
    authorize @post
  end

  def update
    authorize @post
    if @post.update(post_params)
      redirect_to edit_post_path(@post)
    else
      render :edit
    end
  end

  def show
    authorize @post
  end

  def destroy
    @post.destroy
    authorize @post
    flash[:notice] = "Post entitled '#{@post.title}' has been deleted."
    redirect_to dashboard_path
  end

  def publish
    authorize @post
    @post.is_published = true
    @post.save
    redirect_to post_path(@post)
  end

  def unpublish
    authorize @post
    @post.is_published = false
    @post.save
    redirect_to post_path(@post)
  end

  private
  def set_tags
    @tags = ActsAsTaggableOn::Tag.all.map(&:name)
  end

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(
      :title,
      :is_published,
      :publish_date,
      :content,
      tag_list: []
    )
  end
end

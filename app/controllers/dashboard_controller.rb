class DashboardController < ApplicationController
  def index
    @published_posts = current_user.posts.published
    @unpublished_posts = current_user.posts.unpublished
  end
end

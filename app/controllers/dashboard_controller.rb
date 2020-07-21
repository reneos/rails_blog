class DashboardController < ApplicationController
  skip_after_action :verify_policy_scoped

  def index
    users_posts = PostPolicy::Scope.new(current_user, Post).resolve_dashboard.order(publish_date: :desc)
    @published_posts = users_posts.published
    @unpublished_posts = users_posts.unpublished
  end
end

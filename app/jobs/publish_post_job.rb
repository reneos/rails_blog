class PublishPostJob < ApplicationJob
  queue_as :default

  def perform(post_id)
    post = Post.find(post_id)
    if post && !post.published?
      post.is_published = true
      post.save
    end
  end
end

module Helpers
  def create_many_published_posts(quantity, user)
    quantity.times do
      Post.create(
        user: user,
        title: 'Blog Title',
        content: 'This is a blog post',
        is_published: true,
        publish_date: Time.now - rand(0..3).days
      )
    end
  end

  def create_unpublished_post
    visit new_post_path
    fill_in 'Title', with: 'Blog Title'
    fill_in 'Content', with: 'This is a blog post'
    click_on 'Create Post'
  end

  def create_published_post
    visit new_post_path
    fill_in 'Title', with: 'Blog Title'
    fill_in 'Content', with: 'This is a blog post'
    page.check('post[is_published]')
    click_on 'Create Post'
  end
end

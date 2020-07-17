module Helpers
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

require 'rails_helper'

RSpec.describe 'user views a post' do
  before(:each) do
    login_as(FactoryBot.create(:user))
  end

  it 'it displays the post title, content, and publish date' do
    create_unpublished_post
    visit post_path(Post.last)
    expect(page).to have_text('Blog Title')
    expect(page).to have_text('This is a blog post')
  end

  context 'and the post is not published' do
    it 'displays a notice that the post is not published' do
      create_unpublished_post
      visit post_path(Post.last)
      expect(page).to have_text('You are viewing an unpublished post.')
    end

    it 'allows the user to publish the post with a publish button' do
      create_unpublished_post
      post = Post.last
      visit post_path(post)
      click_on('Publish Post')
      post.reload
      expect(post).to be_published
    end
  end

  context 'the post is published'

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

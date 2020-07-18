require 'rails_helper'

RSpec.describe 'user views a post' do
  before(:each) do
    @user = FactoryBot.create(:user)
    login_as(@user)
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

  context 'the post is published' do
    it 'does not display a notice that the post is not published' do
      create_published_post
      visit post_path(Post.last)
      expect(page).to_not have_text('You are viewing an unpublished post.')
    end
  end
end

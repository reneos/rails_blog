require 'rails_helper'

describe 'Submitting new post form' do
  before(:each) do
    login_as(FactoryBot.create(:user))
  end

  context 'without ticking published' do
    before(:each) do
      visit new_post_path
      fill_in 'Title', with: 'Blog Title'
      fill_in 'Content', with: 'This is a blog post'
      click_on 'Create Post'
    end

    it 'successfully creates a new post that is not published' do
      expect(Post.last.is_published).to be false
      expect(Post.last.title).to eq('Blog Title')
    end

    it 'redirects to the edit page' do
      expect(page).to have_current_path(edit_post_path(Post.last))
    end

    it 'displays a preview post button' do
      expect(page).to have_button('Preview Post')
    end
  end

  context 'ticking published' do
    before(:each) do
      visit new_post_path
      fill_in 'Title', with: 'Blog Title'
      fill_in 'Content', with: 'This is a blog post'
      page.check('post[is_published]')
      click_on 'Create Post'
    end

    it 'successfully creates a new post that is not published' do
      expect(Post.last.is_published).to be true
    end

    it 'redirects to the edit page' do
      expect(page).to have_current_path(edit_post_path(Post.last))
    end

    it 'displays a view post button' do
      expect(page).to have_button('View Post')
    end
  end
end

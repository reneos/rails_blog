require 'rails_helper'

RSpec.describe 'user can view index of posts' do
  before(:each) do
    @user = FactoryBot.create(:user)
    login_as(@user)
  end

  it 'only displays published posts' do
    FactoryBot.create_list(:post, 3, user: @user, is_published: 1)
    FactoryBot.create_list(:post, 5, user: @user, is_published: 0)
    visit posts_path
    expect(page).to have_text('Blog Title', count: 3)
  end

  context 'and there are more than 25 posts' do
    it 'displays maximum 25 posts per page' do
      FactoryBot.create_list(:post, 40, user: @user, is_published: 1)
      visit posts_path
      expect(page).to have_text('Blog Title', count: 10)
    end

    it 'displays the correct number of posts on each page' do
      FactoryBot.create_list(:post, 15, user: @user, is_published: 1)
      visit posts_path
      click_on '2'
      expect(page).to have_text('Blog Title', count: 5)
    end
  end
end

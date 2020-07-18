require 'rails_helper'

RSpec.describe 'user can view index of posts' do
  before(:each) do
    @user = FactoryBot.create(:user)
    login_as(@user)
  end

  it 'only displays published posts' do
    FactoryBot.create_list(:post, 3, user: @user, is_published: true)
    FactoryBot.create_list(:post, 5, user: @user, is_published: false)
    visit posts_path
    expect(page).to have_text('Blog Title', count: 3)
  end

end

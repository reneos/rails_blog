require 'rails_helper'

RSpec.describe 'user views dashboard' do
  before(:each) do
    @user = FactoryBot.create(:user)
    login_as(@user)
  end

  it "displays only the user's posts" do
    other_user = FactoryBot.create(:user, username: 'other_user', email: 'other_user@gmail.com')
    FactoryBot.create_list(:post, 5, :published, user: @user)
    FactoryBot.create_list(:post, 5, :published, user: other_user)

    visit dashboard_path

    expect(page).to have_text('Blog Title', count: 5)
  end

  it "displays both published and unpublished posts" do
    FactoryBot.create_list(:post, 5, :published, user: @user, title: 'published')
    FactoryBot.create_list(:post, 5, :unpublished, user: @user, title: 'unpublished')

    visit dashboard_path

    expect(page).to have_text('published', count: 5)
    expect(page).to have_text('unpublished', count: 5)
  end
end

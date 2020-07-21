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
    FactoryBot.create_list(:post, 5, :published, user: @user, title: 'this is a published post')
    FactoryBot.create_list(:post, 5, :unpublished, user: @user, title: 'this is an unpublished post')

    visit dashboard_path

    expect(page).to have_text('this is a published post', count: 5)
    expect(page).to have_text('this is an unpublished post', count: 5)
  end

  it 'has a link to edit posts' do
    post = FactoryBot.create(:post, :published, user: @user)

    visit dashboard_path
    click_on 'Edit'

    expect(page).to have_current_path(edit_post_path(post))
  end

  it 'allows publishing of unpublished posts' do
    post = FactoryBot.create(:post, :unpublished, user: @user)

    visit dashboard_path
    click_on 'Publish'

    post.reload
    expect(post).to be_published
  end

  it 'allows unpublishing of published posts' do
    post = FactoryBot.create(:post, :published, user: @user)

    visit dashboard_path
    click_on 'Unpublish'

    post.reload
    expect(post).to_not be_published
  end

  it 'allows deletion of posts' do
    FactoryBot.create(:post, :published, user: @user)

    visit dashboard_path
    click_on 'Delete'

    expect(Post.count).to eq(0)
  end
end

require 'rails_helper'

RSpec.describe 'user can search through posts' do
  before(:each) { @user = FactoryBot.create(:user) }

  it "can find results from a post's content" do
    FactoryBot.create_list(:post, 3, :published, user: @user, content: 'Banana bread is delicious.')
    FactoryBot.create_list(:post, 3, :published, user: @user, content: 'Bananas are delicious.')

    execute_search('bread')

    expect(page).to have_text('Banana bread is delicious.', count: 3)
  end

  it 'can find results regardless of case' do
    FactoryBot.create_list(:post, 3, :published, user: @user, content: 'Banana bread is delicious.')

    execute_search('banana')

    expect(page).to have_text('Banana bread is delicious.', count: 3)
  end

  it "can find results from a post's title" do
    FactoryBot.create_list(:post, 3, :published, user: @user, title: 'Banana bread is delicious.')

    execute_search('banana')

    expect(page).to have_text('Banana bread is delicious.', count: 3)
  end

  it 'only displays published posts' do
    FactoryBot.create_list(:post, 3, :published, user: @user)
    FactoryBot.create_list(:post, 3, :unpublished, user: @user)

    execute_search('blog')

    expect(page).to have_text('Blog Title', count: 3)
  end

  it 'displays a notice when no results are found' do
    execute_search('banana')

    expect(page).to have_text("No posts found.")
  end

  def execute_search(query)
    visit root_path
    fill_in 'search-bar', with: query
    click_on 'Search'
  end
end

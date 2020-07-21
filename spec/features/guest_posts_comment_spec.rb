require 'rails_helper'

RSpec.describe 'Guest posts a comment on a post' do
  before(:each) do
    user = FactoryBot.create(:user)
    @post = FactoryBot.create(:post, :published, user: user)
  end

  it 'succesfully creates a comment' do
    Comment.create(name: 'Nicole', content: 'Great post', post: @post)

    visit post_path(@post)

    expect(page).to have_text('Great post')
  end
end

require 'rails_helper'

RSpec.describe 'Guest views posts by tag' do
  context 'and posts do not exist with that tag' do
    it 'displays a notice' do
      visit '/posts?tag=notag'

      expect(page).to have_text("No posts found.")
    end
  end

  context 'and posts exist with that tag' do
    it 'displays the correct posts' do
      user = FactoryBot.create(:user)
      FactoryBot.create_list(:post, 3, :published, user: user, title: 'Cool Post', tag_list: 'cool')

      visit '/posts?tag=cool'

      expect(page).to have_text('Cool Post', count: 3)
    end
  end

  context 'and there are multiple tags' do
    it 'displays posts with any of those tags' do
      user = FactoryBot.create(:user)
      FactoryBot.create_list(:post, 3, :published, user: user, title: 'Cool Post', tag_list: 'cool, neat')
      FactoryBot.create_list(:post, 3, :published, user: user, title: 'Cool Post', tag_list: 'cool')

      visit '/posts?tag=cool+neat'

      expect(page).to have_text('Cool Post', count: 6)
    end
  end
end

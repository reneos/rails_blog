require 'rails_helper'

RSpec.describe 'user can view index of posts' do
  let(:user) { FactoryBot.create(:user) }

  before(:each) do
    login_as(user)
  end

  before(:all) do
    create_many_published_posts(40, user)
  end

  it 'only displays published posts' do

  end

  it 'paginates posts above 25' do
  end
end

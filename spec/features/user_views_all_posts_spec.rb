require 'rails_helper'

RSpec.describe 'user can view index of posts' do
  before(:all) do
    @user = FactoryBot.create(:user)
    FactoryBot.create_list(:post, 50, user: @user)
  end

  before(:each) do
    login_as(@user)
  end

  it 'only displays published posts' do
  end

  it 'paginates posts above 25' do
  end
end

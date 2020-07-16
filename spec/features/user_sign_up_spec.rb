require 'rails_helper'

feature 'User signs up' do
  scenario 'with valid values' do
    visit new_user_registration_path
    fill_in 'Username', with: 'username'
    fill_in 'Email', with: 'test@test.com'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    click_on 'Sign up'
    expect(User.count).to eq(1)
  end

  scenario 'with blank fields' do
    visit new_user_registration_path
    fill_in 'Username', with: 'username'
    click_on 'Sign up'
    expect(User.count).to eq(0)
  end
end

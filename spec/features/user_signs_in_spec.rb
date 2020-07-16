require 'rails_helper'

feature 'User signs in' do
  scenario 'sucessfully' do
    User.create!(username: 'user', email: 'email@email.com', password: 'password')
    visit new_user_session_path
    fill_in 'Email', with: 'email@email.com'
    fill_in 'Password', with: 'password'
    click_on 'Log in'
    expect(page).to_not have_current_path(new_user_session_path)
  end

  scenario 'unsucessfully' do
    visit new_user_session_path
    click_on 'Log in'
    expect(page).to have_current_path(new_user_session_path)
  end
end

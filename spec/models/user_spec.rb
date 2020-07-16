require 'rails_helper'

RSpec.describe User do
  context 'validations' do
    it 'ensures presence of email' do
      user = User.create
      expect(user.errors.messages[:email]).to include("can't be blank")
    end

    it 'ensures a valid email address' do
      user = User.create(email: 'email')
      expect(user.errors.messages[:email]).to include('is invalid')
    end

    it 'ensures a unique email address' do
      user = User.create(email: 'test@test.com', password: 'password', username: 'user')
      user2 = User.create(email: 'test@test.com')
      expect(user2.errors.messages[:email]).to include('has already been taken')
    end
  end
end

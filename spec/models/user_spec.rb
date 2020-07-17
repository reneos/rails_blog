require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    it 'enforces presence of email' do
      user = User.create
      expect(user.errors.messages[:email]).to include("can't be blank")
    end

    it 'enforces a valid email address' do
      user = User.create(email: 'email')
      expect(user.errors.messages[:email]).to include('is invalid')
    end

    it 'enforces a unique email address' do
      user = User.create(email: 'test@test.com', password: 'password', username:'user')
      user2 = User.create(email: 'test@test.com')
      expect(user2.errors.messages[:email]).to include('has already been taken')
    end

    it 'enforces presence of username' do
      user = User.create
      expect(user.errors.messages[:username]).to include("can't be blank")
    end

    it 'enforces a unique username' do
      user = User.create(email: 'test@test.com', password: 'password', username:'user')
      user2 = User.create(username: 'user')
      expect(user2.errors.messages[:username]).to include('has already been taken')
    end
  end
end

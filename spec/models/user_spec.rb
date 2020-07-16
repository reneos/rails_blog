require 'rails_helper'

RSpec.describe User do
  context 'validations' do
    it 'ensures presence of email' do
      user = User.create
      expect(user).to_not be_valid
    end

    it 'ensures a valid email address' do
      user = User.create(email: 'email', password: 'password')
      expect(user).to_not be_valid
    end
  end
end

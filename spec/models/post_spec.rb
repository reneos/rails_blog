require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) do
    User.create(
      username: 'username',
      password: 'password',
      email: 'email@email.com'
    )
  end

  context 'validations' do
    subject(:post) { Post.create }

    it 'enforces presence of title' do
      verify_error_message(post, :title, "can't be blank")
    end
    it 'enforces presence of content' do
      verify_error_message(post, :content, "can't be blank")
    end
    it 'enforces presence of user' do
      verify_error_message(post, :user, 'must exist')
    end
    it 'sets is_published to false by default' do
      expect(post.is_published).to be false
    end
  end

  context 'after creation' do
    subject(:post) do
      Post.create(
        title: 'My first blog',
        user: user,
        content: 'My first blog post'
      )
    end

    it 'sets publish_date to same date as created_at' do
      post.reload
      expect(post.publish_date.to_s).to eq(post.created_at.to_s)
    end
  end

  def verify_error_message(model, attribute, message)
    expect(model.errors.messages[attribute]).to include(message)
  end
end

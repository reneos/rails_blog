require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:post) { FactoryBot.create(:post, user: user) }
  subject(:comment) { Comment.create }

  context 'validations' do
    it 'enforces presence of title' do
      verify_error_message(comment, :name, "can't be blank")
    end

    it 'enforces presence of content' do
      verify_error_message(comment, :content, "can't be blank")
    end
  end

  def verify_error_message(model, attribute, message)
    expect(model.errors.messages[attribute]).to include(message)
  end

end

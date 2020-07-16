require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'initialize' do
    it 'sets is_published to false by default'
    it 'sets publish_date to same date as created_at by default'
  end
  context 'validations' do
    it 'enforces presence of title'
    it 'enforces presence of content'
  end
end

class Comment < ApplicationRecord
  belongs_to :post

  validates :name, presence: true
  validates :content, presence: true

  default_scope { order(:created_at) }
end

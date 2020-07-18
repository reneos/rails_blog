class Post < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :content, presence: true

  scope :published, -> { where(is_published: true).order(:publish_date) }
  scope :unpublished, -> { where(is_published: false).order(:publish_date) }

  self.per_page = 25

  def published?
    is_published
  end
end

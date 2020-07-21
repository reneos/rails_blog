class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_one_attached :photo, dependent: :destroy

  after_initialize :set_publish_date

  validates :title, presence: true
  validates :content, presence: true
  validates :publish_date, presence: true

  scope :published, -> { where(is_published: true).order(:publish_date) }
  scope :unpublished, -> { where(is_published: false).order(:publish_date) }

  acts_as_taggable_on :tags

  self.per_page = 25

  def self.search(query)
    Post.where(['content iLIKE :query OR title iLIKE :query', query: "%#{query}%"])
  end

  def published?
    is_published
  end

  def stripped_content
    ActionView::Base.full_sanitizer.sanitize(content)
  end

  private

  def set_publish_date
    self.publish_date ||= Time.now
  end
end

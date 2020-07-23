class Post < ApplicationRecord
  enum is_published: [:unpublished, :published, :scheduled]
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one_attached :photo, dependent: :destroy

  after_initialize :set_publish_date

  validates :title, presence: true
  validates :content, presence: true
  validates :publish_date, presence: true
  validate :publish_date_and_published

  default_scope { order(publish_date: :desc) }

  acts_as_taggable_on :tags

  self.per_page = 10

  def self.search(query)
    Post.where(['content iLIKE :query OR title iLIKE :query', query: "%#{query}%"])
  end

  def stripped_content
    ActionView::Base.full_sanitizer.sanitize(content)
  end

  private

  def publish_date_and_published
    if published? && publish_date > Time.now
      errors.add(
        :publish_date,
        "Can't be in the future if 'is_published' is checked. Posts will automatically be published if set in the future."
      )
    end
  end

  def set_publish_date
    self.publish_date ||= Time.now
  end
end

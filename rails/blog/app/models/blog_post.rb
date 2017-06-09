class BlogPost < ActiveRecord::Base
  STATUSES = %w(draft published unpublished archived)

  validates :content, presence: true
  validates :title,   presence: true
  validates :status,  inclusion: { in: STATUSES }

  # Could also use enum here
  scope :drafts,      -> { where(status: 'draft') }
  scope :published,   -> { where(status: 'published') }
  scope :unpublished, -> { where(status: 'unpublished') }
  scope :archived,    -> { where(status: 'archived') }

  before_create :create_slug

  has_many :comments

  # override to_param method to display slug in url instead of id
  def to_param
    slug
  end

  private

  def create_slug
    self.slug = title.parameterize
  end
end

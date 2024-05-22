# frozen_string_literal: true

class BlogPost < ApplicationRecord # rubocop:disable Style/Documentation
  validates :title, presence: true
  validates :body, presence: true

  scope :draft, -> { where(published_at: nil) }
  scope :sorted, -> { order(published_at: :asc, updated_at: :desc) }
  scope :published, -> { where('published_at <= ?', Time.current) }
  scope :scheduled, -> { where('published_at > ?', Time.current) }

  def to_param
    "#{id}-#{title.parameterize}"
  end

  def draft?
    published_at.nil?
  end

  def published?
    published_at? && published_at <= Time.current
  end

  def scheduled?
    published_at? && published_at > Time.current
  end
end

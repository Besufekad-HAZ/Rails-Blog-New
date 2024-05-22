# frozen_string_literal: true

class BlogPost < ApplicationRecord # rubocop:disable Style/Documentation
  validates :title, presence: true
  validates :body, presence: true

  scope :draft, -> { where(published_at: nil) }
  scope :published, -> { where('published_at <= ?', Time.current) }
  scope :scheduled, -> { where('published_at > ?', Time.current) }

  def to_param
    "#{id}-#{title.parameterize}"
  end
end

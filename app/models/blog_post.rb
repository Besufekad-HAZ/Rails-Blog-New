# frozen_string_literal: true

class BlogPost < ApplicationRecord

  validates :title, presence: true
  validates :body, presence: true

  def to_param
    "#{id}-#{title.parameterize}"
  end
end

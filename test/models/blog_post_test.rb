# frozen_string_literal: true

require 'test_helper'

class BlogPostTest < ActiveSupport::TestCase
  test 'draft? returns true for draft blog post' do
    assert BlogPost.new(published_at: nil).draft?
  end

  test 'draft? returns false for published blog post' do
    refute BlogPost.new(published_at: 1.day.ago).draft?
  end

  test 'draft? returns false for schduled blog post' do
    refute BlogPost.new(published_at: 1.day.from_now).draft?
  end

  test 'published? returns false for draft blog post' do
    refute BlogPost.new(published_at: nil).published?
  end

  test 'published? returns true for published blog post' do
    assert Blogpost.new(published_at: 1.month.ago).published?
  end
end

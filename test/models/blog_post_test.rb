# frozen_string_literal: true

require 'test_helper'

class BlogPostTest < ActiveSupport::TestCase
  # Test for draft? method
  test 'draft? returns true for draft blog post' do
    assert BlogPost.new(published_at: nil).draft?
  end

  test 'draft? returns false for published blog post' do
    refute BlogPost.new(published_at: 1.day.ago).draft?
  end

  test 'draft? returns false for schduled blog post' do
    refute BlogPost.new(published_at: 1.day.from_now).draft?
  end

  # Test for published? method
  test 'published? returns true for published blog post' do
    assert BlogPost.new(published_at: 1.month.ago).published?
  end

  test 'published? returns false for draft blog post' do
    refute BlogPost.new(published_at: nil).published?
  end

  test 'published? returns false for scheduled blog post' do
    refute BlogPost.new(published_at: 1.day.from_now).published?
  end

  # Test for scheduled? method
  test 'scheduled? returns true for scheduled blog post' do
    assert BlogPost.new(published_at: 1.month.from_now).scheduled?
  end

  test 'scheduled? returns false for draft blog post' do
    refute BlogPost.new(published_at: nil).scheduled?
  end

  test 'published? returns false for published blog post' do
    refute BlogPost.new(published_at: 1.day.ago).scheduled?
  end
end

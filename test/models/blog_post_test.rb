# frozen_string_literal: true

require 'test_helper'

class BlogPostTest < ActiveSupport::TestCase
  # Test for draft? method
  test 'draft? returns true for draft blog post' do
    assert draft_blog_post.draft?
  end

  test 'draft? returns false for published blog post' do
    refute published_blog_post.draft?
  end

  test 'draft? returns false for schduled blog post' do
    refute scheduled_blog_post.draft?
  end

  # Test for published? method
  test 'published? returns true for published blog post' do
    assert published_blog_post.published?
  end

  test 'published? returns false for draft blog post' do
    refute draft_blog_post.published?
  end

  test 'published? returns false for scheduled blog post' do
    refute scheduled_blog_post.published?
  end

  # Test for scheduled? method
  test 'scheduled? returns true for scheduled blog post' do
    assert scheduled_blog_post.scheduled?
  end

  test 'scheduled? returns false for draft blog post' do
    refute draft_blog_post.scheduled?
  end

  test 'published? returns false for published blog post' do
    refute published_blog_post.scheduled?
  end

  # Helper function for draft_blog_post
  def draft_blog_post
    BlogPost.new(published_at: nil)
  end

  # Helper function for published_blog_post
  def published_blog_post
    BlogPost.new(published_at: 1.month.ago)
  end

  # Helper function for scheduled_blog_post
  def scheduled_blog_post
    BlogPost.new(published_at: 1.month.from_now)
  end

  # Test for to_param method
  test 'to_param returns id and title' do
    blog_post = BlogPost.new(id: 1, title: 'Hello, World!')
    assert_equal '1-hello-world', blog_post.to_param
  end
end

# frozen_string_literal: true

require 'test_helper'

class BlogPostTest < ActiveSupport::TestCase
  # Test for draft? method
  test 'draft? returns true for draft blog post' do
    assert blog_posts(:draft).draft?
  end

  test 'draft? returns false for published blog post' do
    refute blog_posts(:published).draft?
  end

  test 'draft? returns false for schduled blog post' do
    refute blog_posts(:schduled).draft?
  end

  # Test for published? method
  test 'published? returns true for published blog post' do
    assert blog_posts(:published).published?
  end

  test 'published? returns false for draft blog post' do
    refute blog_posts(:draft).published?
  end

  test 'published? returns false for scheduled blog post' do
    refute blog_posts(:scheduled).published?
  end

  # Test for scheduled? method
  test 'scheduled? returns true for scheduled blog post' do
    assert blog_posts(:scheduled).scheduled?
  end

  test 'scheduled? returns false for draft blog post' do
    refute blog_posts(:draft).scheduled?
  end

  test 'published? returns false for published blog post' do
    refute blog_posts(:published).scheduled?
  end

  # Test for to_param method
  test 'to_param returns id and title' do
    blog_post = BlogPost.new(id: 1, title: 'Hello, World!')
    assert_equal '1-hello-world', blog_post.to_param
  end
end

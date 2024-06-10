class BlogPosts::CoverImagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_blog_post

  def destroy
    @blog_post.cover_image.purge_later
    redirect_to edit_blog_post_path(@blog_post)
  end

  private

  def set_blog_post
    @blog_post = BlogPost.find(params[:blog_post_id])
  end
end

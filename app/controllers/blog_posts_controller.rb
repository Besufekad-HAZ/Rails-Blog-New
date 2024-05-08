class BlogPostsController < ApplicactionController
  def index
    @blog_posts = BlogPost.all
  end
end

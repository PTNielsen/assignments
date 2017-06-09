class BlogPostsController < ApplicationController
  before_action :get_blog_post, only: :show
  
  def index
    @blog_posts = BlogPost.all
  end

  def show
  end

  private

  def get_blog_post
    @blog_post = BlogPost.find_by_slug(params[:slug])
  end
end

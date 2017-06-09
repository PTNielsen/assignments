require 'test_helper'

class BlogPostTest < ActiveSupport::TestCase
  def setup
    @blog_post = BlogPost.new(title: 'Test Blog', content: 'Test Blog Content', status: 'draft')
  end

  test 'valid blog post' do
    assert @blog_post.valid?
  end

  test 'invalid without title' do
    @blog_post.title = nil

    assert !@blog_post.valid?
  end

  test 'invalid without content' do
    @blog_post.content = nil

    assert !@blog_post.valid?
  end

  test 'invalid with no status' do
    @blog_post.status = nil

    assert !@blog_post.valid?
  end

  test 'invalid without proper status' do
    @blog_post.status = 'wrong'

    assert !@blog_post.valid?
  end

  test 'invalid without unique slug' do
    @blog_post.save

    assert_raises(ActiveRecord::RecordNotUnique) do
      BlogPost.create(title: 'Test  Blog', content: 'Test Blog Content', status: 'draft')
    end
  end

  test 'properly creates slug when record is saved' do
    @blog_post.save

    assert_equal 'test-blog', @blog_post.slug
  end
end

class CreateBlogPost < ActiveRecord::Migration[5.0]
  def up
    create_table :blog_posts do |t|
      t.string     :title
      t.text       :content
      t.string     :slug
      t.string     :status
      t.datetime   :published_at

      t.timestamps
    end

    add_index :blog_posts, :title, unique: true
    add_index :blog_posts, :status
    add_index :blog_posts, :slug, unique: true
  end

  def down
    remove_index :blog_posts, :slug
    remove_index :blog_posts, :status
    remove_index :blog_posts, :title
    drop_table :blog_posts
  end
end

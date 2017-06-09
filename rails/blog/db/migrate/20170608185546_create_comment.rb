class CreateComment < ActiveRecord::Migration[5.0]
  def up
    create_table :comments do |t|
      t.text       :content
      t.references :blog_post, foreign_key: true, null: false

      t.timestamps
    end
  end

  def down
    drop_table :comments
  end
end

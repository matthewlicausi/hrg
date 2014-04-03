class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.string :category
      t.string :author
      t.integer :user_id

      t.timestamps
    end
    
    add_index :posts, :user_id
    
  end
end

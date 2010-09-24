class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      
      t.integer :user_id
      t.integer :previous_post
       
      #text and image_path hold either the image or the text
      t.string :text
      t.string :image_path
          
      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end

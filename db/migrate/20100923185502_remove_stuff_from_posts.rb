class RemoveStuffFromPosts < ActiveRecord::Migration
  def self.up
    remove_column :posts, :image_path
  end

  def self.down
  end
end

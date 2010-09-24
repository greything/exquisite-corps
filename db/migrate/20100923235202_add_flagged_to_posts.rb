class AddFlaggedToPosts < ActiveRecord::Migration
  def self.up
    add_column :posts, :flagged, :integer
  end

  def self.down
  end
end

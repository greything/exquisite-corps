class AlterPostsTableToUseChainsInsteadOfThreads < ActiveRecord::Migration
  def self.up
    
    remove_column :posts, :thread_id
    
    change_table :posts do |t|
       t.integer    :chain_id
    end
  end

  def self.down
  end
end

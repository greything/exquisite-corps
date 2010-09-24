class Post < ActiveRecord::Base
  
  belongs_to :chain
  belongs_to :user
  
  has_attached_file :image, :styles => { :small => "200x200>", :main => "800x600>" },
                    :url => "/data/threads/:thread_id/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/data/threads/:thread_id/:id/:style/:basename.:extension"
  
  #validates_attachment_size :image, :less_than => 2.megabytes
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png']

  
end

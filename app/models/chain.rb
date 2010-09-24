class Chain < ActiveRecord::Base

  validates_numericality_of :post_length, :only_integer => true, :message => "can only be whole number."
  validates_inclusion_of :post_length, :in => 2..30, :message => "can only be between 2 and 30."
  
  has_many :posts
  
end

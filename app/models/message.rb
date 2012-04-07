class Message < ActiveRecord::Base
	has_ancestry
	belongs_to :user
	belongs_to :product
	attr_accessible :parent_id, :content
  
	validates :content, :presence => true
end

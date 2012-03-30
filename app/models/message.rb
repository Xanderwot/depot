class Message < ActiveRecord::Base
	has_ancestry
	belongs_to :user
	belongs_to :product
	validates :content, :presence => true
end

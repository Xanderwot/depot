class Product < ActiveRecord::Base

	has_many :line_items
	has_many :orders, :through => :line_items
	has_many :images, :dependent => :destroy
	has_many :messages, :dependent => :destroy

	accepts_nested_attributes_for :images, :reject_if => lambda { |a| a[:image].blank? }
	before_destroy :ensure_not_referenced_by_any_line_item

	validates :title, :presence => true,
	                  :uniqueness => true,
	                  :length => { :within => (4..50),
	                  			   :message => 'must be betwin 4 and 50 characters' }             

	validates :description, :presence => true

	validates :price, :numericality => {:greater_than_or_equal_to => 0.01}



	private
	
		def ensure_not_referenced_by_any_line_item
			if line_items.count.zero?
				return true
			else
				errors.add(:base, 'Line Items present')
				return false
			end
		end


end

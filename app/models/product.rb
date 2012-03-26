class Product < ActiveRecord::Base

	default_scope :order => 'title'

	has_many :line_items
	has_many :orders, :through => :line_items

	before_destroy :ensure_not_referenced_by_any_line_item

	validates :title, :presence => true,
	                  :uniqueness => true,
	                  :length => { :within => (4..50),
	                  			   :message => 'must be betwin 4 and 50 characters' }             

	validates :description, :presence => true

	validates :image_url, :presence => true,
	 					  :format => { :with => (%r{\.(gif|jpg|png)$}i),
									   :message => 'must be a .gif, .jpg or .png image'}	

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

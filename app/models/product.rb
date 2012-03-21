class Product < ActiveRecord::Base

	validates :title, :presence => true,
	                  :uniqueness => true,
	                  :length => { :within => (4..50),
	                  			   :message => 'Title must be betwin 4 and 50 characters' }             

	validates :description, :presence => true

	validates :image_url, :presence => true,
	 					  :format => { :with => (%r{\.(gif|jpg|png)$}i),
									   :message => 'Must be a .gif, .jpg or .png image'}	

	validates :price, :numericality => {:greater_than_or_equal_to => 0.01}

end

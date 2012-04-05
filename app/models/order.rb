class Order < ActiveRecord::Base
	has_many :line_items, :dependent => :destroy
	belongs_to :user
	paginates_per 20
	attr_accessible :name, :address, :pay_type

	PAYMENT_TYPES = Payment.all.map(&:name)

	validates :name, :address, :pay_type, :presence => true
	
	validates :pay_type, :inclusion => PAYMENT_TYPES

	def add_line_items_from_cart(cart)
		cart.line_items.each do |item|
			item.cart_id = nil
			line_items << item
		end
	end

end

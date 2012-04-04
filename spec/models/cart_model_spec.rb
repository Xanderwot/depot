require 'spec_helper'

describe Cart do

	it "Cart total_price method" do
		cart = Cart.create()
		product = FactoryGirl.create(:product)
		FactoryGirl.create(:line_item, :cart_id => cart.id, :product_id => product.id)
		cart.total_price.to_s.should eql("230.0")
	end
end	
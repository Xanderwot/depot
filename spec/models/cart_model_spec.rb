require 'spec_helper'

describe Cart do

	it "total_price method" do
		Factory(:product, :price => 11)
		line_item = Factory(:line_item, :quantity => 23)
		line_item.cart.total_price.to_s.should eql("253.0")
	end
end	
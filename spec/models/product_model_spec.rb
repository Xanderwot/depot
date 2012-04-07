require 'spec_helper'

describe Product do
	
	it "can't destroy if have line_items" do
    	line_item = Factory(:line_item)
		line_item.product.destroy.should be_false
	end	

	it "destroyed without line_items" do
		product = Factory(:product)
		product.destroy.should be_true
	end	

end
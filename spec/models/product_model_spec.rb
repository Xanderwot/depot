require 'spec_helper'

describe Product do
	
	it "Product can't destroy if have line_items" do
		product = FactoryGirl.create(:product)
    	line_item = FactoryGirl.create(:line_item, :product_id => product.id, :price => product.price)
		product.destroy.should be_false
	end	

	it "Product destroyed without line_items" do
		product = FactoryGirl.create(:product)
		product.destroy.should be_true
	end	

end
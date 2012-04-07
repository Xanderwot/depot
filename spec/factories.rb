FactoryGirl.define do
	factory :product do |f|
		f.title "title product"
		f.description "desc"
		f.image_url "img.jpg"
		f.price 12
	end	
	factory :line_item do |f|
		f.after_build do |d|
			d.product = Product.first||Factory(:product)
			d.cart = Cart.create
		end	
	end					
end
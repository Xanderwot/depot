FactoryGirl.define do
	factory :product do |f|
		f.title "title product"
		f.description "desc"
		f.price 10
		f.image_url "rred.jpg"
	end	
	factory :line_item do |f|
		f.product_id 1
		f.quantity 23
	end		
end
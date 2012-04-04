module CartsHelper
	def show_checkout_button
		if @hide_checkout_button.nil?
			first = content_tag("td", button_to('Checkout', new_order_path, :class => :empty_button, :method => :get))
			second = content_tag("td", button_to('Empty', @cart, :confirm => "Are you shure?", :class => :empty_button, :method => :delete, :remote => true)) 
			content_tag("tr", first+second)
		end
	end	
end

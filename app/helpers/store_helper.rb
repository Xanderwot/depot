module StoreHelper
	def available_remote_link(product)
		if current_user.nil?
			link_to image_tag(product.image_url), 
			line_items_path(:product_id => product), 
			:method => :post
		else
			link_to image_tag(product.image_url), 
			line_items_path(:product_id => product), 
			:method => :post, :remote => true
		end		
	end	

	def add_to_cart_button(product)
		if user_signed_in?
			button_to t('.add_html'), line_items_path(:product_id => product), :remote => true	
		end	
	end	

	def comments_link(product)
		if user_signed_in?
			link_to "Comments(#{product.messages.count})", product_messages_path(product), :remote => true
		end
	end	

	def various_image_links(product)
		if product.image_url.nil?
			link_to image_tag(product.images.first.image.thumb('50x50').url), 
			product.images.first.image.url, :class => 'list_image'
		else
			available_remote_link(product)
		end			
	end	
end
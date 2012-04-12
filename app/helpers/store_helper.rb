module StoreHelper
	def available_remote_link(product)
		if current_user.nil?
			link_to image_tag(product.image_url), 
			line_items_path(:product_id => product), 
			:method => :post, :id => "image_url"
		else
			link_to image_tag(product.image_url), 
			line_items_path(:product_id => product), 
			:method => :post, :remote => true, :id => "image_url"
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

	def add_compare_link(product)
		unless session[:compare].nil?
			if session[:compare].include?(product.id)
				link_to "remove from compare", del_compare_path(:id => product), :remote => true
			else		
				link_to "add to compare", add_compare_path(:id => product), :remote => true
			end
		else
				link_to "add to compare", add_compare_path(:id => product), :remote => true
		end		
	end	

	def show_compare_text
		unless session[:compare].nil? || session[:compare].empty?
			if session[:compare].count == 1
				pluralize(session[:compare].count, "product") + " selected"
			else	
				link_to "Compare " + pluralize(session[:compare].count, "product"), show_compare_path  
			end	
		end		
	end	
end
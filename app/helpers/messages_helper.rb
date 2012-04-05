module MessagesHelper
	def nested_messages(messages)
    	messages.map do |message, sub_messages|
      	render(message) + content_tag(:div, nested_messages(sub_messages), :class => "nested_messages")
    	end.join.html_safe
  end

  def hide_destroy_link(message)
  	if can? :destroy, message
  		link_to "Destroy", product_message_path(:id => message), 
  		:method => :delete, :remote => true, :confirm => "Are you shure?"
  	end	
  end	
end

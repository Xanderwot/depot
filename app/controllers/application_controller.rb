class ApplicationController < ActionController::Base
  protect_from_forgery

  @temp_var = nil

    private

  	def current_cart
      if current_user.cart_id.nil?
        cart = Cart.create
        current_user.update_attribute(:cart_id, cart.id)
        cart
      else
        current_user.cart
      end 

    end 

    rescue_from CanCan::AccessDenied do |exception|
      redirect_to root_url, :alert => exception.message
    end   

end

class StoreController < ApplicationController
 
  def index
  	 @products = Product.page params[:page]
                                  
     if user_signed_in?
      @cart = current_cart
     end   
  	 if session[:count].nil?
  	 	session[:count] = 1
  	 else
  	    session[:count] += 1
  	 end	
  	 @variant = session[:count] > 5
  end

end

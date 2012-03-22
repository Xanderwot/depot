class StoreController < ApplicationController
  def index
  	 @products = Product.all
  	 if session[:count].nil?
  	 	session[:count] = 1
  	 else
  	    session[:count] += 1
  	 end	
  	 @variant = session[:count] > 5
  end

end

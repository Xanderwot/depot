class StoreController < ApplicationController
  def index
  	 @products = Product.all
  	 @date_time = Time.now.strftime("Today %d-%b-%Y %H:%m:%S")
  end

end

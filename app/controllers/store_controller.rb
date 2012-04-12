class StoreController < ApplicationController
 
  respond_to :js, :only => [ :add_compare_product, :del_compare_prosucts ]

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
 	  @visits_count = session[:count] > 5
  end

  def add_compare_product
    @product = Product.find(params[:id])
    session[:compare] = [] if session[:compare].nil?
    session[:compare] << @product.id
  end 

  def del_compare_product
    @product = Product.find(params[:id])
    del_art = [] << @product.id
    session[:compare] -= del_art
  end  

  def show_compare_products
    if session[:compare].nil?
      redirect_to root_path
    end  
    @products = Product.where(:id => session[:compare])
    session[:compare] = nil
  end 

end

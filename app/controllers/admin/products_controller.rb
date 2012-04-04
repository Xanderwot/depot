class Admin::ProductsController < ApplicationController

	load_and_authorize_resource
	layout 'admin'

	def index
		@search = @products.search(params[:search])
		@products = @search.paginate(:page => params[:page])
	end		

	def create
       @product = Product.new(params[:product])
       if @product.save
       	 redirect_to admin_products_path
       else
         render :new
       end  	 
	end

	def update
       if @product.save
       	 redirect_to admin_products_path
       else
         render :edit
       end
	end

	def destroy
    	@product.destroy
    	redirect_to admin_products_path
	end	
end
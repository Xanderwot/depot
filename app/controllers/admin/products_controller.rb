class Admin::ProductsController < ApplicationController

	load_and_authorize_resource
	layout 'admin'

	def index
		@search = Product.search(params[:search])
		@products = @search.paginate(:page => params[:page])
	end	

	def show
		@product = Product.find(params[:id])
	end	

	def new
		@product = Product.new
	end	

	def create
       @product = Product.new(params[:product])
       if @product.save
       	 redirect_to admin_products_path
       else
         render :new
       end  	 
	end

	def edit
		@product = Product.find(params[:id])
	end

	def update
		@product = Product.find(params[:id])
       if @product.save
       	 redirect_to admin_products_path
       else
         render :edit
       end
	end

	def destroy
    	@product = Product.find(params[:id])
    	@product.destroy
    	redirect_to admin_products_path
	end	
end
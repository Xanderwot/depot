class Admin::ProductsController < AdminController

	load_and_authorize_resource

	def index
		@search = @products.search(params[:search])
		@products = @search.paginate(:page => params[:page])
	end		

	def create
    @product = Product.new(params[:product])
    respond_with [:admin, @product], :notice => "Product created"  	 
	end

	def update
    @product.update_attributes(params[:product])
    respond_with [:admin, @product], :notice => "Product updated"
	end

	def destroy
    @product.destroy
    redirect_to admin_products_path, :notice => "Product destroyed"
	end	
end
class Admin::ProductsController < AdminController

	load_and_authorize_resource

	def index
		@search = @products.search(params[:search])
		@products = @search.paginate(:page => params[:page])
	end		

	def create
       @product = Product.new(params[:product])
       if @product.save
       	 redirect_to admin_products_path, :notice => "Product created"
       else
         render :new
       end  	 
	end

	def update
    @product.update_attributes(params[:product])
       if @product.save
       	 redirect_to admin_products_path, :notice => "Product updated"
       else
         render :edit
       end
	end

	def destroy
    	@product.destroy
    	redirect_to admin_products_path, :notice => "Product destroyed"
	end	
end
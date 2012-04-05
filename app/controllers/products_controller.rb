class ProductsController < ApplicationController

  load_and_authorize_resource
 
  def index
    @products = @products.paginate :page => params[:page], 
                                   :order => 'created_at desc',
                                   :per_page => 10                             
  end
end

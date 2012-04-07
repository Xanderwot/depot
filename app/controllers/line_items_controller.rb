class LineItemsController < ApplicationController

  before_filter :authenticate_user!
  load_and_authorize_resource
  respond_to :js, :only => :create

  def index
    @line_items = @line_items.paginate(:page => params[:page])
  end

  def create
    session[:count] = 0
    @cart = current_cart
    product = Product.find(params[:product_id])
    @line_item = @cart.add_product(product.id, product.price)
    @line_item.save
    respond_with @line_item
  end

  def destroy
    @cart = current_cart
    cart = @line_item.cart
    if cart.line_items.count == 1 && @line_item.quantity == 1
        cart.destroy 
    else
      if @line_item.quantity == 1
        @line_item.destroy
      else        
        @line_item.decrement!(:quantity)
      end      
    end
  end
end

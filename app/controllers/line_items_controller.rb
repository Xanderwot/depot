class LineItemsController < ApplicationController

  load_and_authorize_resource

  respond_to :js, :html

  def index
    @line_items = @line_items.paginate(:page => params[:page])
  end

  def create
    session[:count] = 0
    @cart = current_cart
    product = Product.find(params[:product_id])
    @line_item = @cart.add_product(product.id, product.price)

      if @line_item.save
        respond_with(@line_item)
      end
  end

  def update

      if @line_item.update_attributes(params[:line_item])
        respond_with(@line_item)
      end

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

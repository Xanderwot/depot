class OrdersController < ApplicationController

  load_and_authorize_resource

  def index
    @orders = @orders.paginate(:page => params[:page])
  end

  def new
    @cart = current_cart
    @hide_checkout_button = true
    if @cart.line_items.empty?
      redirect_to root_url, :notice => "Your cart is empty"
      return
    end
  end

  def create
    @order.add_line_items_from_cart(current_cart)
    @order.user_id = current_user.id
    @order.email = current_user.email
    if @order.save
      current_cart.destroy
    end
    respond_with @order
  end

  def update
    @order.update_attributes(params[:order])
    respond_with @order  
  end

  def destroy
    @order.destroy
    respond_with @order, :location => orders_url  
  end
end

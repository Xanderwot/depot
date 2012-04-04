class OrdersController < ApplicationController

  load_and_authorize_resource

  respond_to :js, :html

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

      if @order.save
        @order.update_attributes(:user_id => current_user.id, :email => current_user.email)
        current_cart.destroy
        # Notifier.order_received(@order).deliver
        respond_with(@order, :location => orders_url)
      else
        respond_with(@order, :location => new_order_url)
      end
  end

  def update

      if @order.update_attributes(params[:order])
        respond_with(@order, :location => orders_url)
        # Notifier.order_shipped(@order).deliver
      else
        respond_with(@order, :location => order_url)
      end
  
  end

  def destroy

    @order.destroy

    respond_with(@order, :location => orders_url)
  
  end
end

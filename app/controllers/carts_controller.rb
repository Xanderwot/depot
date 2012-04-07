class CartsController < ApplicationController

  load_and_authorize_resource
  respond_to :js, :only => :destroy 

  def show
    begin
      @cart = current_cart
      rescue ActiveRecord::RecordNotFound
        logger.error "Attempt to access invalid cart #{params[:id]}"
        redirect_to root_url, :notice => 'Invalid cart'
      else
        respond_with @cart
    end
  end

  def create
    respond_with @cart
  end

  def update
    @cart = current_cart
    respond_with @cart
  end

  def destroy
    @cart = current_cart
    @cart.destroy
    respond_with @cart, :location => root_url
  end
       
end

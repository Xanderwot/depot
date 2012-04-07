class MessagesController < ApplicationController

  load_and_authorize_resource
  before_filter :current_product
  respond_to :js

  def index
  	@messages = @product.messages.scoped
    @message = @product.messages.new
  end

  def new
  	@message = Message.new(:parent_id => params[:parent_id])
  end

  def create
    @messages = @product.messages.scoped
    @message.attributes = params[:message]
    @message.user_id = current_user.id
    @message.product_id = @product.id
    @message.save
  end	

  def destroy
    @messages = @product.messages.scoped
    @message.destroy
  end

  private

  	def current_product
    	@product = Product.find(params[:product_id])
  	end	  

end

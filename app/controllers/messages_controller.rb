class MessagesController < ApplicationController
	before_filter :current_product
  load_and_authorize_resource
  respond_to :js
  def index
  	@messages = @product.messages.scoped
    @message = @product.messages.new	
  end

  def new
  	@message = Message.new(:parent_id => params[:parent_id])
  end

  def create
    	if @message.save
    		@message.update_attributes(:user_id => current_user.id, :product_id => @product.id)
    		@messages = @product.messages.scoped
    	else
      		render :new
    	end	
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

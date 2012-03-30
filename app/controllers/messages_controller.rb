class MessagesController < ApplicationController
	before_filter :current_product
  def index
  	@messages = @product.messages.scoped
    @message = @product.messages.new
    respond_to do |format|
    	format.js
    end	
  end

  def show
  	@message = Message.find(params[:id])
  	respond_to do |format|
    	format.js
    end
  end

  def new
  	@message = Message.new(:parent_id => params[:parent_id])
  	respond_to do |format|
    	format.js
    end
  end

  def create
  	@message = Message.new(params[:message])
  	respond_to do |format|
    	if @message.save
    		@message.update_attributes(:user_id => current_user.id, :product_id => @product.id)
    		@messages = @product.messages.scoped
      		format.js
    	else
      		render :new
    	end
    end	
  end	

  def destroy
  	@message = Message.find(params[:id])
    @message.destroy
    redirect_to messages_url
  end

  private

  	def current_product
    	@product = Product.find(params[:product_id])
  	end	  

end

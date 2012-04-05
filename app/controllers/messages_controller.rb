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
    @message.user_id = current_user.id
    @message.product_id = @product.id
   	if @message.save
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

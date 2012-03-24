class LineItemsController < ApplicationController

  def index
    @line_items = LineItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @line_items }
    end
  end

  def show
    @line_item = LineItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @line_item }
    end
  end

  def new
    @line_item = LineItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @line_item }
    end
  end

  def edit
    @line_item = LineItem.find(params[:id])
  end

  def create
    session[:count] = 0
    @cart = current_cart
    product = Product.find(params[:product_id])
    @line_item = @cart.add_product(product.id, product.price)


    respond_to do |format|
      if @line_item.save
        format.html { redirect_to(@line_item.cart, :notice => 'Line item was successfully created.') }
        format.xml  { render :xml => @line_item, :status => :created, :location => @line_item }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @line_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @line_item = LineItem.find(params[:id])

    respond_to do |format|
      if @line_item.update_attributes(params[:line_item])
        format.html { redirect_to(@line_item, :notice => 'Line item was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @line_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @line_item = LineItem.find(params[:id])
    cart_id = @line_item.cart_id
    cart_count = Cart.find(cart_id).line_items.count
    atr = @line_item.cart
    cur_price = @line_item.price
    if cart_count == 1 && @line_item.quantity == 1
        Cart.find(cart_id).destroy
        respond_to do |format|
          format.html { redirect_to(store_path, :notice => 'Cart was removed') }
          format.xml  { head :ok }
        end  
    else
      if @line_item.quantity == 1 || params[:del_all] == 'true'
        @line_item.destroy
      else        
        @line_item.decrement!(:quantity)
      end
      respond_to do |format|
        format.html { redirect_to(atr, :notice => 'Item was removed') }
        format.xml  { head :ok }    
      end      
    end
  end
end

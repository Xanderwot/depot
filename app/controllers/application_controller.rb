class ApplicationController < ActionController::Base
  before_filter :set_i18n_locale_from_params
  protect_from_forgery

  @hide_checkout_button = nil

    private

  	def current_cart
      if current_user.cart_id.nil?
        cart = Cart.create
        current_user.update_attribute(:cart_id, cart.id)
        cart
      else
        current_user.cart
      end 

    end 

    rescue_from CanCan::AccessDenied do |exception|
      redirect_to root_url, :alert => exception.message
    end 
   protected
   def set_i18n_locale_from_params
      if params[:locale]
        if I18n.available_locales.include?(params[:locale].to_sym)
          I18n.locale = params[:locale]
        else
          flash.now[:notice] =
          "#{params[:locale]} translation not available"
          logger.error flash.now[:notice]
        end
      end
    end

    def default_url_options
      { :locale => I18n.locale }
    end
 
end

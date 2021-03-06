class ApplicationController < ActionController::Base
	 # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    before_action :authorize
    before_action :set_i18n_locale

    protect_from_forgery with: :exception
  
    private
     
    def current_cart
        Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
        cart = Cart.create
        session[:cart_id] = cart.id
        cart
    end

    helper_method :current_cart

    protected
  
    def authorize
        @user = User.find_by_id(session[:user_id]) 
        if @user == nil
            redirect_to '/login', :notice => 'You must login first'
        end
    end

    def set_i18n_locale 
        if params[:locale] 
            if I18n.available_locales.include?(params[:locale].to_sym)
                I18n.locale = params[:locale] 
            else
                flash.now[:notice] = params[:locale] + ' is not supported'              
            end
        end
    end
  
    def default_url_options 
        { :locale => I18n.locale }
    end
end

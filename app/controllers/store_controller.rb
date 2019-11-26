class StoreController < ApplicationController
  skip_before_action :authorize
  
  def index 
        if params[:set_locale]
            @redirectURL = '/' + params[:set_locale] 
            redirect_to @redirectURL
        else
            @products = Product.all
            @cart = current_cart
        end
  end
end

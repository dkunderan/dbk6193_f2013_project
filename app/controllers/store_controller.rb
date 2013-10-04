class StoreController < ApplicationController
  skip_before_filter :authorize
  def index
  if params[:set_locale]
      redirect_to store_path(:locale => params[:set_locale])
    else
      @products = Product.all
      @cart = current_cart
      @counter = session[:counter]
      @counter.nil? ? @counter = 1 : @counter+=1
      session[:counter] = @counter
    end
  end
end

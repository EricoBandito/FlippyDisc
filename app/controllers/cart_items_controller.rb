class CartItemsController < ApplicationController
  def index
    @cart_items = Disc.find(session[:cart])
  end

  def clear
    session[:cart] = []
    @cart_items = Disc.find(session[:cart])
    render :index
  end
end

class DiscsController < ApplicationController
  def index
    @discs = Disc.search(params[:type], params[:input]).page(params[:page]).per(8)
    @types = Disc.select(:disc_type).distinct
  end

  def show
    @disc = Disc.find(params[:id])
  end

  def cart

  end

  def add_to_cart
    id = params[:id].to_i

    unless session[:cart].include?(id)
      session[:cart] << id
    end

  end

  def remove_cart_item(disc_id)
    session[:cart].delete(disc_id)
  end


end

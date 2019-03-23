class DiscsController < ApplicationController
  def index
    @discs = Disc.search(params[:type], params[:input]).page(params[:page]).per(8)
    @types = Disc.select(:disc_type).distinct
  end

  def show
    @disc = Disc.find(params[:id])
  end
end

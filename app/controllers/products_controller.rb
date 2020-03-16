class ProductsController < ApplicationController
  before_action :authenticate_user!

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @stock_quantity = 0
    @product.arrivals.each do |arrival|
      @stock_quantity += arrival.count
    end
  end
end

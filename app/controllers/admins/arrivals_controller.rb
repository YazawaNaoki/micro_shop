class Admins::ArrivalsController < ApplicationController
  before_action :authenticate_admin!

  def index_all
    @arrivals = Arrival.all
  end

  def index
    @product = Product.find(params[:product_id])
    @arrivals = @product.arrivals
  end

  def new
    @product = Product.find(params[:product_id])
    @arrival = Arrival.new
  end

  def create
    @product = Product.find(params[:product_id])
    @arrival = Arrival.new(arrival_params)
    @arrival.product_id = @product.id
    if @arrival.save
      redirect_to admins_product_path(@product.id), success: "入荷情報をを登録しました。"
    else
      render :new
    end
  end

  def show
  end

  private
  def arrival_params
    params.require(:arrival).permit(:count, :arrival_date)
  end
end

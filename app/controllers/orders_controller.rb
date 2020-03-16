class OrdersController < ApplicationController
  def index
    @orders = current_user.orders
  end

  def show
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.user_id = current_user.id
    @order.order_status = 1
    current_user.cart_items.each do |cart_item|
      sub_total = cart_item.product.price * cart_item.quantity
      @order.total_price += sub_total
    end
    @order.total_price * 1.1
    if @order.save
      current_user.cart_items.each do |cart_item|
        @order_product = @order.order_products.build
        @order_product.order_id = @order.id
        @order_product.product_id = cart_item.product_id
        @order_product.quantity = cart_item.quantity
        @order_product.save
        cart_item.destroy
      end
      redirect_to order_done_path(@order)
    else
      render :new
    end

  end

  def done
  end

  private
  def order_params
    params.require(:order).permit(:user_id, :pay_method, :order_status, :postage, :total_price, :address_id,
    order_products_attributes: [:id, :quantity, :_destroy])
  end
end

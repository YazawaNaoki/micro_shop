class CartItemsController < ApplicationController
  before_action :require_cart, only: [:index_confirm]

  def index
  end

  def index_confirm
    @total_price = 0
    current_user.cart_items.each do |cart_item|
      sub_total = cart_item.product.price * cart_item.quantity
      @total_price += sub_total
    end
  end

  def create
    chosen_product = Product.find(params[:product_id])
    # If cart already has this product then find the relevant cart_item and iterate quantity otherwise create a new line_item for this product
    if current_user.products.include?(chosen_product)
      # Find the cart_item with the chosen_product
      @cart_item = current_user.cart_items.find_by(:product_id => chosen_product.id)
      # Iterate the cart_item's quantity by one
      @cart_item.quantity += 1
    else
      @cart_item = CartItem.new
      @cart_item.user = current_user
      @cart_item.product_id = chosen_product.id
    end
    # Save and redirect to cart show path
    @cart_item.save
    redirect_to cart_items_path
  end

  def add_quantity
    @cart_item = CartItem.find(params[:id])
    @cart_item.quantity += 1
    @cart_item.save
    redirect_to cart_items_path
  end

  def reduce_quantity
    @cart_item = CartItem.find(params[:id])
    if @cart_item.quantity > 1
      @cart_item.quantity -= 1
    end
    @cart_item.save
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  private
  def cart_item_params
    params.require(:caer_item).permit(:quantity,:product_id, :user_id)
  end

  def require_cart
    if current_user.cart_items.empty?
      flash[:warning] = "カートの中身が空なので購入確認画面に進めません。"
      redirect_to cart_items_path
    end
  end
end

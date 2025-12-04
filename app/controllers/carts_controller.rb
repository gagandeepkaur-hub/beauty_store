class CartsController < ApplicationController
  before_action :load_cart

  # GET /cart
  def show
    # @cart is a hash like { "1" => 2, "3" => 1 }
    product_ids = @cart.keys
    @cart_items = Product.where(id: product_ids)
  end

  # POST /cart/add/:product_id
  def add
    product_id = params[:product_id].to_s

    @cart[product_id] ||= 0
    @cart[product_id] += 1

    session[:cart] = @cart

    redirect_to cart_path, notice: "Item added to cart."
  end

  # DELETE /cart/remove/:product_id
  def remove
    product_id = params[:product_id].to_s

    @cart.delete(product_id)
    session[:cart] = @cart

    redirect_to cart_path, notice: "Item removed from cart."
  end

  private

  def load_cart
    # cart stored in session as hash: { "product_id" => quantity }
    session[:cart] ||= {}
    @cart = session[:cart]
  end
end

class CartItemsController < ApplicationController
  include CurrentCart
  before_action :initialize_cart

  def create
    product_id = params[:product_id].to_i
    quantity = params[:quantity]&.to_i || 1

    if @cart[product_id]
      @cart[product_id] += quantity
    else
      @cart[product_id] = quantity
    end

    save_cart
    flash[:notice] = "Product added to cart!"
    redirect_to product_path(product_id)
  end

  def update
    product_id = params[:id].to_i
    quantity = params[:quantity].to_i

    if quantity > 0
      @cart[product_id] = quantity
      flash[:notice] = "Cart updated!"
    else
      @cart.delete(product_id)
      flash[:notice] = "Item removed from cart!"
    end

    save_cart
    redirect_to cart_path
  end

  def destroy
    product_id = params[:id].to_i
    @cart.delete(product_id)

    save_cart
    flash[:notice] = "Item removed from cart!"
    redirect_to cart_path
  end
end
class CartController < ApplicationController
  include CurrentCart
  before_action :initialize_cart

  def show
    @cart_items = {}

    @cart.each do |product_id, quantity|
      product = Product.find_by(id: product_id)
      @cart_items[product] = quantity if product
    end

    @total = @cart_items.sum { |product, quantity| product.price * quantity }
  end
end
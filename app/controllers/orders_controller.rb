class OrdersController < ApplicationController
  before_action :load_cart, only: [:new, :create]

  def index
    @orders = Order.order(created_at: :desc)
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    if @cart.blank?
      redirect_to cart_path, alert: "Your cart is empty."
    else
      @order = Order.new
    end
  end

  def create
    if @cart.blank?
      redirect_to cart_path, alert: "Your cart is empty."
      return
    end

    @order = Order.new(order_params)

    ActiveRecord::Base.transaction do
      @order.save!

      @cart.each do |product_id, quantity|
        product = Product.find(product_id)
        @order.order_items.create!(
          product: product,
          quantity: quantity,
          price: product.price
        )
      end

      # Clear the cart only after success
      session[:cart] = {}
    end

    redirect_to @order, notice: "Order placed successfully!"
  rescue ActiveRecord::RecordInvalid => e
    flash.now[:alert] = "There was a problem with your order: #{e.message}"
    render :new, status: :unprocessable_entity
  end

  private

  def order_params
    params.require(:order).permit(
      :customer_name,
      :customer_email,
      :customer_address
    )
  end

  def load_cart
    session[:cart] ||= {}
    @cart = session[:cart]
  end
end

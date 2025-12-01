class OrdersController < ApplicationController
  include CurrentCart
  before_action :authenticate_user!
  before_action :initialize_cart, only: [:new, :create]

  def index
    @orders = current_user.orders.order(created_at: :desc)
  end

  def show
    @order = current_user.orders.find(params[:id])
  end

  def new
    if @cart.empty?
      redirect_to cart_path, alert: "Your cart is empty"
      return
    end

    @order = Order.new
    @cart_items = load_cart_items
    @subtotal = calculate_subtotal

    if current_user.primary_address
      @order.province_id = current_user.primary_address.province_id
    end
  end

  def create
    @order = current_user.orders.build(order_params)
    @cart_items = load_cart_items

    @subtotal = calculate_subtotal
    province = Province.find(params[:order][:province_id])
    tax_rate = province.total_tax_rate / 100.0
    @tax = @subtotal * tax_rate
    @total = @subtotal + @tax

    @order.subtotal = @subtotal
    @order.tax = @tax
    @order.total = @total
    @order.status = 'pending'

    @order.shipping_street = params[:order][:shipping_street]
    @order.shipping_city = params[:order][:shipping_city]
    @order.shipping_province_name = province.name
    @order.shipping_postal_code = params[:order][:shipping_postal_code]

    ActiveRecord::Base.transaction do
      if @order.save
        @cart_items.each do |product, quantity|
          @order.order_items.create!(
            product: product,
            quantity: quantity,
            price: product.price
          )
        end

        if params[:save_address] == '1'
          address = current_user.addresses.first_or_initialize
          address.street = @order.shipping_street
          address.city = @order.shipping_city
          address.province_id = @order.province_id
          address.postal_code = @order.shipping_postal_code
          address.save
        end

        session[:cart] = {}

        flash[:notice] = "Order placed successfully!"
        redirect_to order_path(@order)
      else
        render :new
      end
    end
  rescue ActiveRecord::RecordInvalid => e
    flash.now[:alert] = "There was an error: #{e.message}"
    @cart_items = load_cart_items
    @subtotal = calculate_subtotal
    render :new
  end

  private

  def order_params
    params.require(:order).permit(:province_id)
  end

  def load_cart_items
    items = {}
    @cart.each do |product_id, quantity|
      product = Product.find_by(id: product_id)
      items[product] = quantity if product
    end
    items
  end

  def calculate_subtotal
    load_cart_items.sum { |product, quantity| product.price * quantity }
  end
end
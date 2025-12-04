class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    # If you don't have associations yet, keep it simple:
    @orders = Order.all
    # Later: @orders = current_user.orders
  end
end

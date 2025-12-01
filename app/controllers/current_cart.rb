module CurrentCart
  extend ActiveSupport::Concern

  private

  def initialize_cart
    @cart = session[:cart] || {}
    @cart = @cart.transform_keys(&:to_i)
  end

  def save_cart
    session[:cart] = @cart
  end
end
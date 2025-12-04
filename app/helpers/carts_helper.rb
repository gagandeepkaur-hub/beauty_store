module CartsHelper
  def cart_total(cart_items)
    cart_items.sum(&:price)
  end
end

class HomeController < ApplicationController
  def index
    # load some products for the homepage
    @products = Product.all      # or Product.limit(8)
  end
end

class ProductsController < ApplicationController
  def index
    @categories = Category.order(:name)

    # build ransack search object
    @q = Product.ransack(params[:q])

    # default: sort by name if nothing else
    @products = @q.result.includes(:category).order(:name)
  end

  def show
    @product = Product.find(params[:id])
  end
end

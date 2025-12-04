class ProductsController < ApplicationController
  def index
    scope = Product.all

    # Optional: filter by category from your header links
    if params[:category].present?
      scope = scope.where(category: params[:category])
    end

    # Kaminari pagination
    @products = scope.page(params[:page]).per(12)
  end

  def show
    @product = Product.find(params[:id])
  end
end


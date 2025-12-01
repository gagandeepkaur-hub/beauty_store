class ProductsController < ApplicationController
  def index
    @products = Product.all.order(created_at: :desc)

    @products = @products.on_sale if params[:on_sale] == 'true'
    @products = @products.new_arrivals if params[:new_arrivals] == 'true'
    @products = @products.recently_updated if params[:recently_updated] == 'true'
    @products = @products.where(category: params[:category]) if params[:category].present?

    if params[:search].present?
      search_term = "%#{params[:search]}%"
      @products = @products.where("name ILIKE ? OR description ILIKE ?", search_term, search_term)
    end

    @products = @products.page(params[:page]).per(12)
  end

  def show
    @product = Product.find(params[:id])
  end
end
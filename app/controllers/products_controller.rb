class ProductsController < ApplicationController
  def index
    render json: products, each_serializer: ProductSerializer
  end

  private

  def products
    @products ||= Product.all
  end
end

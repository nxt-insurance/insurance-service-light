class PricesController < ApplicationController
  def create
    render json: price, serializer: PriceSerializer
  end

  private

  def price
    @price ||= price_calculator.new(configuration: configuration).call
  end

  def price_calculator
    @price_calculator ||= active_product_generation.price_calculator.constantize
  end

  def active_product_generation
    @active_product_generation ||= product.active_product_generation
  end

  def product
    @product ||= Product.find_by(key: params.require(:product_key))
  end

  def configuration
    @configuration ||= begin
      validate_configuration
      configuration_param
    end
  end

  def validate_configuration
    ConfigurationValidator.new(product_generation: active_product_generation, configuration: configuration_param).call
  end

  def configuration_param
    @configuration_param ||= params.require(:configuration).to_h.with_indifferent_access
  end
end

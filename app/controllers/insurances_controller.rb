class InsurancesController < ApplicationController
  def create
    render json: insurance, serializer: InsuranceSerializer
  end

  private

  def insurance
    @insurance ||= Insurance.create!(
      user_id: user_id,
      product_generation: active_product_generation,
      start_at: Time.current.tomorrow.beginning_of_day,
      configuration: configuration,
      gross_price: price
    )
  end

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

  def user_id
    # we can be sure that this is the user_id of the authenticated user
    params.require(:user_id)
  end
end

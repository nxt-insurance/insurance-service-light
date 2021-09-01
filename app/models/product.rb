class Product < ApplicationRecord
  has_many :product_generations
  has_one :active_product_generation, -> { latest }, class_name: ProductGeneration.name
  has_many :insurances, through: :product_generations

  def configuration_schema
    @configuration_schema ||= active_product_generation.configuration_schema.to_h.with_indifferent_access
  end
end

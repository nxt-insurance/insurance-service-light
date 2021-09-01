class Insurance < ApplicationRecord
  belongs_to :product_generation
  has_one :product, through: :product_generation
end

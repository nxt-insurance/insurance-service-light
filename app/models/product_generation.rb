class ProductGeneration < ApplicationRecord
  belongs_to :product
  has_many :insurances

  scope :latest, -> { order(created_at: :desc).limit(1) }
end

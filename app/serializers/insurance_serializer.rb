class InsuranceSerializer < ActiveModel::Serializer
  attributes :user_id, :product_key, :start_at, :end_at, :configuration, :gross_price, :currency

  def product_key
    object.product_generation.product.key
  end
end

class CreateProductGenerations < ActiveRecord::Migration[6.1]
  def change
    create_table :product_generations, id: :uuid, default: -> { "gen_random_uuid()" } do |t|
      t.references :product, foreign_key: true, type: :uuid, null: false
      t.string :key, index: true, unique: true
      t.jsonb :configuration_schema, null: false, default: {}
      t.string :price_calculator

      t.timestamps
    end
  end
end

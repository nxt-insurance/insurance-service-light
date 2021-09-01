class CreateInsurances < ActiveRecord::Migration[6.1]
  def change
    create_table :insurances do |t|
      t.uuid :user_id, index: true, null: false
      t.references :product_generation, foreign_key: true, type: :uuid, null: false
      t.datetime :start_at, null: false
      t.datetime :end_at
      t.jsonb :configuration, null: false, default: {}
      t.decimal :gross_price, null: false

      t.timestamps
    end
  end
end

class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto') # provides gen_random_uuid()

    create_table :products, id: :uuid, default: -> { "gen_random_uuid()" } do |t|
      t.string :key, index: true, unique: true

      t.timestamps
    end
  end
end

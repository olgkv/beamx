class CreateServiceProviders < ActiveRecord::Migration[7.0]
  def change
    create_table :service_providers do |t|
      t.string :name, null: false

      t.timestamps
    end
    add_index :service_providers, :name, unique: true
  end
end

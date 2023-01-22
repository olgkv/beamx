class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.datetime :date, null: false
      t.references :user, null: false, foreign_key: true
      t.references :service_provider, null: false, foreign_key: true

      t.timestamps
    end
  end
end

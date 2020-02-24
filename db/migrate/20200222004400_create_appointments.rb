class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.datetime :appointment_date
      t.belongs_to :user, foreign_key: true
      t.belongs_to :patient, foreign_key: true

      t.timestamps
    end
  end
end

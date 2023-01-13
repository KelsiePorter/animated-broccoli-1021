class CreateDoctorPatients < ActiveRecord::Migration[5.2]
  def change
    create_table :doctor_patients do |t|
      t.belongs_to :doctor, foreign_key: true
      t.belongs_to :patient, foreign_key: true

      t.timestamps
    end
  end
end

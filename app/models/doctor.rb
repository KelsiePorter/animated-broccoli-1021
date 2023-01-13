class Doctor < ApplicationRecord
  belongs_to :hospital
  has_many :doctor_patients
  has_many :patients, through: :doctor_patients

  def patient_count 
    patients.count
  end

  # def self.order_by_most_to_least_patients
  #   AR query to order all doctors by number of patients
  # end
end

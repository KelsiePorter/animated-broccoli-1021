require 'rails_helper'

RSpec.describe Patient do
  describe 'relationships' do 
    it {should have_many :doctor_patients}
    it {should have_many(:doctors).through(:doctor_patients)}
  end

  describe 'class methods' do 
    before :each do 
      @patient_1 = Patient.create!(name: "Dean", age: 55)
      @patient_2 = Patient.create!(name: "Tayo", age: 33)
      @patient_3 = Patient.create!(name: "Moses", age: 47)
      @patient_4 = Patient.create!(name: "Tyler", age: 23)
      @patient_5 = Patient.create!(name: "Madison", age: 18)
      @patient_6 = Patient.create!(name: "Chris", age: 10)
      @patient_7 = Patient.create!(name: "Katie", age: 17)
    end

    it 'returns all patients older than 18 in acending order' do 
      expect(Patient.patients_over_18_acending).to eq([@patient_1, @patient_3, @patient_2, @patient_4])
      expect(Patient.patients_over_18_acending).to_not eq([@patient_6, @patient_7, @patient_5])
    end
  end
end
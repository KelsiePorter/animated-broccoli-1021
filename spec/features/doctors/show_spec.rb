require 'rails_helpers'

RSpec.describe 'doctors show page' do 
  before :each do 
    @hospital_1 = hospital.create!(name: "Children's")
    @doctor_1 = Doctor.create!(name: "River", specialty: "dermatology", university: "CU", hospital_id: @hospital_1.id)
    
    @hospital_2 = hospital.create!(name: "Lutheran")
    @doctor_2 = Doctor.create!(name: "Bodi", specialty: "cardiology", university: "MSU", hospital_id: @hospital_2.id)

    @patient_1 = Patient.create!(name: "Dean", age: 55)
    @patient_2 = Patient.create!(name: "Tayo", age: 33)
    @patient_3 = Patient.create!(name: "Moses", age: 47)
    @patient_4 = Patient.create!(name: "Tyler", age: 23)
    @patient_5 = Patient.create!(name: "Madison", age: 18)
    @patient_6 = Patient.create!(name: "Chris", age: 10)
    @patient_7 = Patient.create!(name: "Katie", age: 17)

    @doctor_1.patients << @patient_1
    @doctor_1.patients << @patient_2
    @doctor_1.patients << @patient_5
    @doctor_1.patients << @patient_6
    @doctor_1.patients << @patient_7

  end
  describe 'user story 1' do 
    it 'displays all of the doctors information the hospital where they work and all of the doctors patients' do 
      visit "/doctor/#{@doctor_1.id}"

      expect(page).to have_content(@doctor_1.name)
      expect(page).to have_content(@doctor_1.specialty)
      expect(page).to have_content(@doctor_1.university)

      expect(page).to have_content(@hospital_1.name)
      expect(page).to_not have_content(@hospital_2.name)

      expect(page).to have_content(@patient_1.name)
      expect(page).to have_content(@patient_2.name)
      expect(page).to have_content(@patient_5.name)
      expect(page).to have_content(@patient_6.name)
      expect(page).to have_content(@patient_7.name)
      expect(page).to_not have_content(@patient_3.name)
      expect(page).to_not have_content(@patient_4.name)
    end
  end
end
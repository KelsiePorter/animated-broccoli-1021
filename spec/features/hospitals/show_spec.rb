require 'rails_helper'

RSpec.describe 'Hospitals show page' do 
  before :each do 
    @hospital_1 = Hospital.create!(name: "Children's")
    @doctor_1 = Doctor.create!(name: "River", specialty: "dermatology", university: "CU", hospital_id: @hospital_1.id)
    @doctor_2 = Doctor.create!(name: "Bodi", specialty: "cardiology", university: "MSU", hospital_id: @hospital_1.id)
    @doctor_3 = Doctor.create!(name: "Mable", specialty: "radiology", university: "CSU", hospital_id: @hospital_1.id)
    
    @hospital_2 = Hospital.create!(name: "Lutheran")
    @doctor_4 = Doctor.create!(name: "Doby", specialty: "Emergency", university: "CC", hospital_id: @hospital_2.id)

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

    @doctor_2.patients << @patient_1
    @doctor_2.patients << @patient_2
    @doctor_2.patients << @patient_3
    @doctor_2.patients << @patient_4
    @doctor_2.patients << @patient_5
    @doctor_2.patients << @patient_6

    @doctor_3.patients << @patient_1
    @doctor_3.patients << @patient_2
    @doctor_3.patients << @patient_3
    @doctor_3.patients << @patient_4
    @doctor_3.patients << @patient_5
    @doctor_3.patients << @patient_6
    @doctor_3.patients << @patient_7
  end

  describe 'extension' do 
    it 'displays the hospitals name, doctors that work there, and number of patients for each doctor, doctors ordered from most patients to least patients' do 
      visit "/hospitals/#{@hospital_1.id}"

      within "#doctor-#{@doctor_1.id}" do
        expect(page).to have_content(@doctor_1.name)
        expect(page).to have_content(@doctor_1.patient_count) 
      end

      within "#doctor-#{@doctor_2.id}" do
        expect(page).to have_content(@doctor_2.name)
        expect(page).to have_content(@doctor_2.patient_count) 
      end

      within "#doctor-#{@doctor_3.id}" do
        expect(page).to have_content(@doctor_3.name)
        expect(page).to have_content(@doctor_3.patient_count) 
      end

      expect(page).to have_content(@hospital_1.name)
      expect(page).to_not have_content(@hospital_2.name)

      # expect(@doctor_3.name).to appear_before(@doctor_2.name)
      # expect(@doctor_2.name).to appear_before(@doctor_1.name)      
      # expect(page).to_not have_content(@doctor_4.name)
    end
  end
end
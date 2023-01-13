require 'rails_helper'

RSpec.describe 'patient index page' do 
  before :each do 
    @patient_1 = Patient.create!(name: "Dean", age: 55)
    @patient_2 = Patient.create!(name: "Tayo", age: 33)
    @patient_3 = Patient.create!(name: "Moses", age: 47)
    @patient_4 = Patient.create!(name: "Tyler", age: 23)
    @patient_5 = Patient.create!(name: "Madison", age: 18)
    @patient_6 = Patient.create!(name: "Chris", age: 10)
    @patient_7 = Patient.create!(name: "Katie", age: 17)
  end

  describe 'user story 3' do 
    it 'displays a list of all patients older than 18 in acending alpagbetical order' do 
      visit "/patients"

      expect(@patient_1.name).to appear_before(@patient_3.name)
      expect(@patient_3.name).to appear_before(@patient_2.name)
      expect(@patient_2.name).to appear_before(@patient_4.name)
      expect(page).to_not have_content(@patient_5.name)
      expect(page).to_not have_content(@patient_6.name)
      expect(page).to_not have_content(@patient_7.name)
    end
  end
end
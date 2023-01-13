class PatientsController < ApplicationController
  
  def index
    patients = Patient.all
    @patients = patients.patients_over_18_acending
  end
end
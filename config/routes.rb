Rails.application.routes.draw do

  #doctors
  get '/doctors/:id', to: 'doctors#show'
  delete '/doctors/:doctor_id/patients/:patient_id', to: 'doctor_patients#destroy'

  #patients
  get '/patients', to: 'patients#index'

  #hospitals
  get '/hospitals/:id', to: 'hospitals#show'
end

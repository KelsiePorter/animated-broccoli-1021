Rails.application.routes.draw do

  #doctors
  get '/doctors/:id', to: 'doctors#show'
end

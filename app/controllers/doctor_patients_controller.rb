class DoctorPatientsController < ApplicationController

  def destroy
   doctor_patient = DoctorPatient.find_by(
      doctor_id: permitted_params[:doctor_id], 
      patient_id: permitted_params[:patient_id]
    )
    doctor_patient.destroy
    redirect_to "/doctors/#{permitted_params[:doctor_id]}"
  end

  private 

  def permitted_params
    params.permit(:doctor_id, :patient_id)
  end
end
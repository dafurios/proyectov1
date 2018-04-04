# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    super

         role = params[:user][:role]

        if role == 'empresa'
          resource.type = 'Enterprise'
        elsif role == 'tutor'
          resource.type = 'Tutor'
        elsif role == 'chofer'
          resource.type = 'Driver'
        elsif role == 'coordinador'
          resource.type = 'Coordinator'
        end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
  end

  def after_sign_in_path_for(user)
    super(user)
    if user.role == 'tutor'
      tutor_students_path(user)
    elsif user.role == 'chofer'
      enterprise_driver_path(user.enterprise_id, user.id)
    elsif user.role == 'empresa'
      enterprise_drivers_path(user)
    elsif user.role == 'coordinador'
      coordinators_path(user)
    end
  end


end

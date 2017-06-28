class RegistrationsController < Devise::RegistrationsController
  def after_sign_in_path_for(resource)
        planes_path
  end 
end
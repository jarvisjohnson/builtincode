class Clients::RegistrationsController < Devise::RegistrationsController

  # def update_resource(resource, params)
  #   if resource.encrypted_password.blank? || params[:password].blank?
  #     resource.email = params[:email] if params[:email]
  #     if !params[:password].blank? && params[:password] == params[:password_confirmation]
  #       logger.info "Updating password"
  #       resource.password = params[:password]
  #       resource.save
  #     end
  #     if resource.provider
  #       resource.update_without_password(params)
  #     else
  #       resource.save       
  #     end
  #   else
  #     resource.update_with_password(params)
  #   end
  # end

  # protected

  #   def after_update_path_for(resource)
  #     root_path
  #   end  
  protected

  def update_resource(resource, params)
    if resource.provider
      resource.update_without_password(params)
    else
      resource.update_with_password(params)
    end
  end  

end
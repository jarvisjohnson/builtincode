class Clients::InvitationsController < Devise::InvitationsController

  before_filter :update_sanitized_params, only: :update

  def after_accept_path_for(resource)
    dashboard_index_path
  end

  # PUT /resource/invitation
  def update
    respond_to do |format|
      format.js do
        invitation_token = Devise.token_generator.digest(resource_class, :invitation_token, update_resource_params[:invitation_token])
        self.resource = resource_class.where(invitation_token: invitation_token).first
        resource.skip_password = true
        resource.update_attributes update_resource_params.except(:invitation_token)
      end
      format.html do
        super
      end
    end
  end

  # https://github.com/scambra/devise_invitable/wiki/Invite-a-Resource-(or-User)-that-Has-Already-Signed-Up-without-Invitation
  def invite_resource(&block)
    @client = Client.find_by(email: invite_params[:email])
    # @user is an instance or nil
    if @client && @client.email != current_client.email
      # invite! instance method returns a Mail::Message instance
      @client.invite!(current_client)
      # return the user instance to match expected return type
      @client
    else
      # invite! class method returns invitable var, which is a User instance
      resource_class.invite!(invite_params, current_inviter, &block)
    end
  end  


  protected

  def update_sanitized_params
    devise_parameter_sanitizer.permit(:accept_invitation, keys: [:business_name, :contact_name, :password, :password_confirmation, :invitation_token, :avatar, :avatar_cache, :hosting_units, :billing_currency])
  end
end

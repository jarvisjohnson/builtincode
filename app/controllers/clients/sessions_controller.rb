class Clients::SessionsController < Devise::SessionsController

  before_filter :remove_authentication_flash_message_if_root_url_requested

  prepend_before_filter :verify_client, only: [:destroy]

  private

  def remove_authentication_flash_message_if_root_url_requested
    if session[:user_return_to] == root_path and flash[:alert] == I18n.t('devise.failure.unauthenticated')
      flash[:alert] = nil
    end
    raise
  end

  def verify_client
    ## redirect to appropriate path
    redirect_to new_client_session_path, notice: 'You have signed out. Please sign in again.' and return unless client_signed_in?
  end  

end
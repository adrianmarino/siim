class SessionsController < Devise::SessionsController
  # -------------------------------------------------------------------------
  # Public Methods...
  # -------------------------------------------------------------------------
  def create
    self.resource = warden.authenticate!(auth_options)
    set_flash_message(:notice, :signed_in) if is_navigational_format?
    sign_in(resource_name, resource)
    resource.ensure_authentication_token!

    respond_to do |format|
      format.html do
        respond_with resource, :location => after_sign_in_path_for(resource)
      end
      format.json do
        render :json => { :response => 'ok', :auth_token => current_user.authentication_token }.to_json, :status => :ok
      end
    end
  end
end

class SessionsController < Devise::SessionsController
  prepend_before_filter :require_no_authentication, :only => [ :new, :create ]
  prepend_before_filter :allow_params_authentication!, :only => :create

  # GET /resource/sign_in
  def new
    resource = build_resource(nil, :unsafe => true)
    clean_up_passwords(resource)
    respond_with(resource, serialize_options(resource))
  end

  # POST /resource/sign_in
  def create
    resource = warden.authenticate!(auth_options)
    set_flash_message(:notice, :signed_in) if is_navigational_format?
    sign_in(resource_name, resource)
    respond_with resource, :location => after_sign_in_path_for(resource)
  end

  def update
    super
  end
  # DELETE /resource/sign_out
  def destroy
    super
  end
  
  def check_acc
      @user = User.find_by_username(params[:user][:username].to_s)
	#if @user
	#	@user = "false"
	#  else
	#	@user = "true"
	#  end
	respond_to do |format|
	  format.json { render :json => !@user }
	end
  end
  protected
	
  def after_sign_in_path_for(resource)
    root_path
  end

end
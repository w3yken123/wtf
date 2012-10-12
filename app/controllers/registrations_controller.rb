# encoding: utf-8
class RegistrationsController < Devise::RegistrationsController
  prepend_before_filter :require_no_authentication, :only => [ :new, :create, :cancel ]
  prepend_before_filter :authenticate_scope!, :only => [:edit, :update, :destroy]
  
  before_filter :cstory_record, :except => [ :new, :create, :cancel ]
  # GET /resource/sign_up
  def new
    super
	
  end

  # POST /resource
  def create
    build_resource
	
    if resource.save
	  UserProfile.create( :user_id => resource.id )
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_navigational_format?
        sign_in(resource_name, resource)
        respond_with resource, :location => after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
        expire_session_data_after_sign_in!
        respond_with resource, :location => after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      redirect_to new_user_registration_url( :confirmation_token => params[:confirmation_token], :email => params[:user][:email], :username => params[:user][:username] ), :flash => { :account => "此帳號已有人使用" }
    end
	
  end

  # GET /resource/edit
  def edit
    @user = current_user
	if current_user.level == 0
	  @custom = Custom.find_by_user_id(current_user.id)
	elsif current_user.level == 1
	  @agent = Agent.find_by_user_id(current_user.id)
	end
  end

  # PUT /resource
  def update
	@user = User.find(current_user.id)
	if @user && params[:user][:email]
	  if @user.update_attributes(params[:user]) 
	    flash[:notice] = "更新Email完成"
	    sign_in @user, :bypass => true
		if @user.level == 1
          redirect_to account_agent_path, :flash => { :email => "E-Mail變更成功" }
		elsif @user.level == 0
		  redirect_to account_custom_path, :flash => { :email => "E-Mail變更成功" }
		end
	  else
		if @user.level == 1
		  redirect_to account_agent_path, :flash => { :email => "此E-Mail"+@user.errors[:email].join(", ") }
		elsif @user.level == 0
		  redirect_to account_custom_path, :flash => { :email => "此E-Mail"+@user.errors[:email].join(", ") }
		end
	  end
	else
      self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
	  if resource.update_with_password(resource_params)
	    if is_navigational_format?
          if resource.respond_to?(:pending_reconfirmation?) && resource.pending_reconfirmation?
            flash_key = :update_needs_confirmation
          end
          set_flash_message :notice, flash_key || :updated
        end
        sign_in resource_name, resource, :bypass => true
		if @user.level == 1
		  redirect_to account_agent_path, :flash => { :pwd_success => "密碼變更成功" }
		elsif @user.level == 0
		  redirect_to account_custom_path, :flash => { :pwd_success => "密碼變更成功" }
		end
	  else
	    flash[:notice] = "更新密碼錯誤"
	    clean_up_passwords resource
		if @user.errors[:current_password]
		  @current_pwd = "舊密碼不正確"
		end
		if @user.errors[:password]
		  @pwd = @user.errors[:password].join(", ")	
		end
		if @user.level == 1
	      redirect_to account_agent_path, :flash => { :pwd => @pwd, :current_pwd => @current_pwd }
		elsif @user.level == 0
		  redirect_to account_custom_path, :flash => { :pwd => @pwd, :current_pwd => @current_pwd }
		end
	  end
	end
	
  end

  # DELETE /resource
  def destroy
    super
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  def cancel
    super
  end
 
  protected
  
  def after_update_path_for(resource)
    edit_user_registration_path
  end
  
  def cstory_record
    @cstory_working = Require.where("custom_id = ? and maker_receive_money_time is not null and ( creation_story_status is null or creation_story_status = 0 )",Custom.find_by_user_id(current_user.id)).all
	@cstory_finish = Require.where("custom_id = ? and creation_story_status >= 1",Custom.find_by_user_id(current_user.id)).all
  end
  
  def after_sign_up_path_for(resource)
    new_user_registration_path
  end
  
end
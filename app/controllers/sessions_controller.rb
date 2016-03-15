class SessionsController < Devise::SessionsController
  respond_to :json
  def create
    resource = warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")
    render :status => 200,
      :json => { :success => true,
                 :info => "Logged in",
                 :user => current_user
    }
  end

  def destroy
    warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")
    sign_out
    render :status => 200,
      :json => { :success => true,
                 :info => "Logged out",
    }
  end

  def failure
    render :status => 401,
      :json => { :success => false,
                 :info => "Login Credentials Failed"
    }
  end

  def show_current_user
    warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")
    puts current_user.to_json
    render :status => 200,
      :json => { :success => true,
                 :info => "Current User",
                 :user => current_user
    }

  end
  # before_filter :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.for(:sign_in) << :attribute
  # end
end

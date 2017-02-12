class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google
    if request.env['omniauth.auth']['extra']['raw_info']['hd'] == 'itpm-gk.com'
      @user = User.find_for_google_oauth(request.env['omniauth.auth'], current_user)
      if @user.persisted?
        set_flash_message(:notice, :success, kind: "Google") if is_navigational_format?
        sign_in_and_redirect @user, event: :authentication
      else
        session['devise.google_data'] = request.env['omniauth.auth']
        redirect_to new_user_registration_url
      end
    else
      redirect_to new_user_session_path
    end

    
  end
end

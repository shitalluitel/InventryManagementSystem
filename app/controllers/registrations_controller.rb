class RegistrationsController < Devise::RegistrationsController
  layout 'dash'
  prepend_before_filter :require_no_authentication, :only => []
  prepend_before_filter :authenticate_scope!

  private

  def sign_up_params
    params.require(:user).permit(:first_name,:middle_name, :last_name, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:first_name,:middle_name, :last_name, :email, :password, :password_confirmation, :current_password)
  end

end
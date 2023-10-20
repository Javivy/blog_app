class Users::RegistrationsController < Devise::RegistrationsController
  prepend_before_action :require_no_authentication, only: %i[new create]
  prepend_before_action :authenticate_scope!, only: %i[edit update destroy]

  private

  def sign_up_params
    params.require(:user).permit(:name, :email, :bio, :photo_url, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:name, :email, :bio, :photo_url, :password, :password_confirmation, :current_password)
  end
end

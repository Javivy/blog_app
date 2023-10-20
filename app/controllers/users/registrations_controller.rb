# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  prepend_before_action :require_no_authentication, only: [:new, :create]
  prepend_before_action :authenticate_scope!, only: [:edit, :update, :destroy]

  private

  def sign_up_params
    params.require(:user).permit(:name, :email, :bio, :photo_url, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:name, :email, :bio, :photo_url, :password, :password_confirmation, :current_password)
  end
end

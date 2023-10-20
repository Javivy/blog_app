class UserMailer < ApplicationMailer
  include Devise::Controllers::UrlHelpers

  def confirmation_email(user, confirmation_url)
    @user = user
    @confirmation_url = confirmation_url
    mail(to: @user.email, subject: 'Confirm your email address')
  end
end

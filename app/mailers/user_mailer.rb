class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def welcome_email
    mail(to: 'a@sd.as', subject: 'Welcome to My Awesome Site')
  end

  def forgot_password(to_email, token)
    @token = token
    mail(to: to_email, subject: 'Forgot Password?')
  end

end

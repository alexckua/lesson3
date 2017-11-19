class ForgotPasswordController < ApplicationController

  def create
    @user ||= User.find_by_email(params[:user][:email])

    if @user
      signed_token = message_verifier.generate( @user.token )

      UserMailer.forgot_password(@user.email, signed_token ).deliver
      notice_message = 'Message sent, please check your email'
    else
      notice_message = 'Can\'t find such user'
    end

    redirect_to new_forgot_password_path, notice: notice_message
  end

  def edit
    @token = params[:id]
  end

  def update
    unsigned_token = message_verifier.verify(params[:user][:token])
    @user ||= User.find_by_token( unsigned_token )

    if @user
      @user.update_attribute(:password, params[:user][:password])
      notice_message = 'Success! Password has been changed'
    else
      notice_message = 'Fail! Something bad is here'
    end

    redirect_to root_path, notice: notice_message

    rescue StandardError => e
      redirect_to root_path, notice: 'Something wrong'
  end

  private

  def message_verifier
    ActiveSupport::MessageVerifier.new(Rails.application.secrets[:message_verifier_secret_message])
  end

end

class UserMailer < ApplicationMailer
  def welcome_email
    @user = User.first
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end

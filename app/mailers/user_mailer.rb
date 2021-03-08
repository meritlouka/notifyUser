class UserMailer < ApplicationMailer
  def ticket_email
    @user = User.first
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end

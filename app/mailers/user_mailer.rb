class UserMailer < ApplicationMailer
  def ticket_email user
    @user = user
    mail(to: @user.email, subject: 'Ticket Due Date Notfication')
  end
end

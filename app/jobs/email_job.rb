class EmailJob < ApplicationJob
  @queue = :email

  def perform(user)
    UserMailer.with(user: user).welcome_email.deliver_now
  end
end
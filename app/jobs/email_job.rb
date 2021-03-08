class EmailJob < ApplicationJob
  @queue = :email

  def perform(user)
    UserMailer.with(user: user).ticket_email(user).deliver_now
  end
end
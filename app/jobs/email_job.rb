class EmailJob
  @queue = :email

  def self.perform(user)
    UserMailer.with(user: user).welcome_email.deliver_now
  end
end
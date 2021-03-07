class UsersController < ApplicationController
  # POST /users
  # POST /users.json
  def sendEmails
    @user = User.last

    # Tell the UserMailer to send a welcome email after save
    UserMailer.with(user: @user).welcome_email.deliver_later

  end
end
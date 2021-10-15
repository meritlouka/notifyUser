module NotificationMethods
  class EmailNotification < ApplicationService
    def initialize(user)
      @user = user
    end

    def call
       EmailJob.perform_later(@user)
    end
  end
end
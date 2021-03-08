module NotificationMethods
  class EmailNotification
    def call(user)
       EmailJob.perform_later(user)
    end
  end
end
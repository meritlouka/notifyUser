module NotificationMethods
  class EmailNotification
    def call(user)
       Resque.enqueue(EmailJob,user)
    end
  end
end
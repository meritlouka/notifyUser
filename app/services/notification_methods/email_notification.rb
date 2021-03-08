module NotificationMethods
  class EmailNotification
    def call(user)
       #Resque.enqueue(EmailJob,user)
       EmailJob.perform_later(user)
    end
  end
end
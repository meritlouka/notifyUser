module Notification
  class NotifyUser < ApplicationService
    def initialize
      @notification_methods = ["EmailNotification"]
    end

    def call
      User.with_notifications.find_each(batch_size: 50) do |user|
          if user.notification_time_arrived?
            user.tickets.find_each(batch_size: 50) do |ticket|
              if user.should_notified_for_ticket? ticket
                NotificationMethods::NotificationFactory.call(@notification_methods, user)
              end
            end
          end
      end
    end
  end
end
module Notification
  class NotifyUser
    def call
      User.with_notifications.find_each(batch_size: 50) do |user|
          notification_methods = ["EmailNotification"]
          if user.due_date_reminder_time.strftime('%H:%M') == Time.now.in_time_zone(user.time_zone).strftime('%H:%M')
            user.tickets.find_each(batch_size: 50) do |ticket|
              if ticket.due_date.strftime("%Y-%m-%d") == (Date.today + user.due_date_reminder_interval).strftime("%Y-%m-%d")
                NotificationMethods::NotificationFactory.new().call(notification_methods, user)
              end
            end
          end
      end
    end
  end
end
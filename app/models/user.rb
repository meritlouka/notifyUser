class User < ApplicationRecord
    has_many :tickets, foreign_key: 'assigned_user_id'
    scope :with_notifications, -> {
        where(send_due_date_reminder: true)
    }

    def notification_time_arrived?
       self.due_date_reminder_time.strftime('%H') == Time.now.in_time_zone(self.time_zone).strftime('%H')
    end

    def should_notified_for_ticket? ticket
        (Date.today + self.due_date_reminder_interval).strftime("%Y-%m-%d") == ticket.due_date.strftime("%Y-%m-%d")
    end
end

class User < ApplicationRecord
    has_many :tickets, foreign_key: 'assigned_user_id'
    scope :with_notifications, -> {
                where(send_due_date_reminder: true)
            }
end

FactoryBot.define do
  factory :user do
    name {"user name"}
    email {"test@test.com"}
    send_due_date_reminder {true}
    due_date_reminder_interval {0}
    due_date_reminder_time {Time.now.strftime('%H:%M')}
    time_zone {"cairo"}
  end
end
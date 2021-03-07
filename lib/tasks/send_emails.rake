namespace :SendNotifcation do
  #description "@TODO write a descripion"
  task DueDate: :environment do
    # your logic goes here
    User.find_each(batch_size: 50) do |user|
        if  user.send_due_date_reminder
            if user.due_date_reminder_time.strftime('%H:%M') == Time.now.strftime('%H:%M')
                user.tickets.find_each(batch_size: 50) do |ticket|
                   if ticket.due_date.strftime("%Y-%m-%d") == (Date.today - user.due_date_reminder_interval).strftime("%Y-%m-%d")
                        UserMailer.with(user: @user).welcome_email.deliver_now
                   end
                end
            end
        end
    end
  end
end
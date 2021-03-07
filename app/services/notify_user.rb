class NotifyUser
  def initialize()
  end

  def call
    User.find_each(batch_size: 50) do |user|
        if  user.send_due_date_reminder
            if user.due_date_reminder_time.strftime('%H:%M') == Time.now.strftime('%H:%M')
                user.tickets.find_each(batch_size: 50) do |ticket|
                   if ticket.due_date.strftime("%Y-%m-%d") == (Date.today - user.due_date_reminder_interval).strftime("%Y-%m-%d")
                      Resque.enqueue(EmailJob,user)
                   end
                end
            end
        end
    end
  end
end
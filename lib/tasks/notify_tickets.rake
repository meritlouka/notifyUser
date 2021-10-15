namespace :SendNotifcation do
  task DueDate: :environment do
    Notification::NotifyUser.call
  end
end
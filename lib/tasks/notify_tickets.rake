namespace :SendNotifcation do
  task DueDate: :environment do
    Notification::NotifyUser.new().call
  end
end
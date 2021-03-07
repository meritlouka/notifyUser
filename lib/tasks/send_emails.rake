namespace :SendNotifcation do
  #description "@TODO write a descripion"
  task DueDate: :environment do
    # your logic goes here
   NotifyUser.new().call
  end
end
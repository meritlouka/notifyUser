create crontab for this rake task to run every minute to  check all users:
* * * * * rake SendNotifcation:DueDate

to run tests:
rake rspec spec/*

structure:
service implmented through factory design pattern to allow more methods

steps to install:
bundle install
rake db:migrate
rake db:seed
set  smtp cred in development.rb
update email of user model created
rake SendNotifcation:DueDate


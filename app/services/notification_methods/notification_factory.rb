module NotificationMethods
  class NotificationFactory < ApplicationService
    def initialize(notification_methods, user)
      @notification_methods = notification_methods
      @user = user
    end

    def call
        @notification_methods.each do |method|
            "NotificationMethods::#{method}".constantize.call(@user)
        end
    end
  end
end
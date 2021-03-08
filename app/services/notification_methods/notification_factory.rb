module NotificationMethods
  class NotificationFactory
    def call(notification_methods,user)
        notification_methods.each do |method|
            "NotificationMethods::#{method}".constantize.new().call(user)
        end
    end
  end
end
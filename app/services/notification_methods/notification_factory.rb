module NotificationMethods
  class NotificationFactory
    def call(methods,user)
        methods.each do |method|
            "NotificationMethods::#{method}".constantize.new().call(user)
        end
    end
  end
end
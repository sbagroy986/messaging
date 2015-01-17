class User < ActiveRecord::Base
  acts_as_messageable :required   => :body                  # default [:topic, :body]
end


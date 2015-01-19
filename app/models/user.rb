class User < ActiveRecord::Base
  acts_as_messageable :required   => [:body,:topic],                  # default [:topic, :body]
  					  :dependent => :destroy
end


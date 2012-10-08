class User < ActiveRecord::Base
attr_accessible :name, :email

Email_Regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

validates_presence_of :name
validates_length_of :name, :maximum => 10
validates_format_of :email , :with => Email_Regex
validates_uniqueness_of :email ,:case_sensitive => false

end

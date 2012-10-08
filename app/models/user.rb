require 'digest'
class User < ActiveRecord::Base
attr_accessor :password
attr_accessible :name, :email ,:password, :password_confirmation


Email_Regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

validates_presence_of :name
validates_length_of :name, :maximum => 10

validates_format_of :email , :with => Email_Regex
validates_uniqueness_of :email ,:case_sensitive => false

validates_presence_of :password
validates_length_of :password, :within => 6..40
validates_confirmation_of :password

before_save :encrypt_password

# Return true if the user's password matches the submitted password.
def has_password?(submitted_password)
	self.encrypted_password == encrypt(submitted_password)
end


# This is a class method, can be defined using self.methodname , User.methodname , class << self   def methodname end  end
def self.authenticate(sub_email,sub_password)
	temp_user = find_by_email(sub_email)
	return nil if temp_user.nil?
	return temp_user if temp_user.has_password?(sub_password)
end

private
	def encrypt_password
		self.salt = make_salt
		self.encrypted_password = encrypt(password)
	end

	def make_salt
		secure_hash("#{Time.now.utc}#{password}")
	end
	
	def encrypt(s_pswd)
		secure_hash("#{salt}#{s_pswd}")
	end

	def secure_hash(string)
		Digest::SHA2.hexdigest(string)
	end


end

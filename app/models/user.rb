class User < ActiveRecord::Base
	attr_accessible :name, :email, :password, :password_confirmation
	attr_accessor :password
	validates_presence_of	:name
	validates_confirmation_of	:password

	def password=(password)
		encryption = PasswordEncryptor.encrypt(password)

		self.password_salt = encryption[:salt]
		self.password_hash = encryption[:hash]
		@password =  password
	end
end

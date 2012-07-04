class User < ActiveRecord::Base
	attr_accessible :name, :email, :password, :password_confirmation
	attr_accessor :password

	validates_presence_of	:name, :password
	validates_confirmation_of	:password
	validates_format_of :email, :with => /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i
	validates_uniqueness_of :email

	has_many :questions

	def password=(password)
		encryption = PasswordEncryptor.encrypt(password)

		self.password_salt = encryption[:salt]
		self.password_hash = encryption[:hash]
		@password =  password
	end
end

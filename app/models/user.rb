class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation
  attr_reader :password

  validates_presence_of :name, :password
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates_confirmation_of :password
  validates_uniqueness_of :email

  has_many :questions
  has_many :replies

  scope :signed_up, limit(20).order("id desc")

  def to_son(options = {})
    options.merge!(:except => [:password_hash, :password_salt])
    super(options)
  end

  def password=(password)
    encryption = PasswordEncryptor.encrypt(password)

    self.password_salt = encryption[:salt]
    self.password_hash = encryption[:hash]

    @password = password
  end
end

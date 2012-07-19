class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation
  attr_reader :password

  validates_presence_of :name
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates_presence_of :password, :password_confirmation, :if => :validate_password?
  validates_confirmation_of :password, :if => :validate_password?
  validates_uniqueness_of :email
  validates_inclusion_of :role, :in => %w[admin user]

  has_many :questions, :dependent => :destroy
  has_many :replies, :dependent => :destroy

  scope :signed_up, limit(20).order("id desc")

  def to_json(options = {})
    options.merge!(:except => [:password_hash, :password_salt])
    super(options)
  end

  def admin?
    role == "admin"
  end

  def password=(password)
    encryption = PasswordEncryptor.encrypt(password)

    self.password_salt = encryption[:salt]
    self.password_hash = encryption[:hash]

    @password = password
  end

  private
  def validate_password?
    new_record? || password.present? || password_confirmation.present?
  end
end

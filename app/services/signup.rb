class Signup
  def initialize(user, url)
    @user = user
    @url = url
  end

  def complete
    @user.save.tap do |success|
      send_welcome_email if success
    end
  end

  def send_welcome_email
    Mailer.welcome({
      :email => @user.email,
      :name => @user.name,
      :url => @url
    }).deliver
  end
end

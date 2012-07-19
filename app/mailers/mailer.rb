class Mailer < ActionMailer::Base
  default :from => "Hackerboard <noreply@hackerboard.com>"

  # Send welcome e-mail to a new user.
  #
  # Required options:
  #
  # # <tt>:email</tt>: The user's email.
  # # <tt>:url</tt>: The login url.
  # # <tt>:name</tt>: The user's name.
  #
  def welcome(options)
    @options = options

    mail :subject => t("subjects.welcome"), :to => options[:email] do |format|
      format.text
      format.html
    end
  end
end

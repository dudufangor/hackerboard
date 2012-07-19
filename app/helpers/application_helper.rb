module ApplicationHelper
  # Display a inline error message for that attribute.
  #
  #   <%= error_for @user, :name %>
  #
  def error_for(record, attribute)
    message = record.errors[attribute].first
    content_tag :span, message, :class => "error" if message
  end

  # Display avatar and link to user profile.
  #
  def profile_link(user)
    content_tag :span, :class => "user" do
      link_to(gravatar(user.email, :alt => user.name), user_path(user), :class => "avatar") +
      link_to(user.name, user_path(user), :class => "name")
    end
  end

  # Build an image to the user's gravatar.
  #
  def gravatar(email, options = {})
    hash = Digest::MD5.hexdigest(email.to_s)
    url = "http://www.gravatar.com/avatar/#{hash}.jpg?d=mm"
    image_tag url, options
  end
end

class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user, :logged_in?

  # before_filter :set_locale_by_scope
  before_filter :set_locale_by_subdomain

  private
  def logged_in?
    current_user.present?
  end

  def current_user
    @current_user ||= session[:user_id] && User.find_by_id(session[:user_id])
  end

  def self.require_logged_user(options = {})
    before_filter :require_logged_user, options
  end

  def require_logged_user
    return if logged_in?

    redirect_to login_path, :alert => t("flash.auth.alert")
  end

  def set_locale_by_scope
    locale = params.fetch(:locale, I18n.default_locale).to_sym
    I18n.locale = locale if I18n.available_locales.include?(locale)
  end

  def set_locale_by_subdomain
    locale = request.host.split(".").first.to_sym
    locale = I18n.default_locale unless I18n.available_locales.include?(locale)
    I18n.locale = locale
  end
end

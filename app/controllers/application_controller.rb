class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, prepend: true

  before_action :authenticate_login!
  before_action :set_signed_cookie!, if: ->{current_login}


  helper_method :current_account

  def current_account
    current_login.accounts.first
  end

  def set_signed_cookie!
    cookies.signed[:login_id] ||= current_login&.id.to_s
  end
end

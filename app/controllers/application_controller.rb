class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  before_filter :authenticate_user!
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
#   protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }
  protect_from_forgery# with: :exception

  after_action :set_csrf_cookie_for_ng

  def set_csrf_cookie_for_ng
    puts "AQUIIIII"
    cookies['XSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?
  end

  protected

  def verified_request?
    super || form_authenticity_token == request.headers['X-XSRF-TOKEN']
  end
end

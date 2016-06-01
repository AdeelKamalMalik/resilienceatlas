class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session, only: Proc.new { |c| c.request.format.json? }
  before_action :show_token, :check_subdomain, :get_subdomain
  after_filter :set_csrf_cookie
  def show_token
    Rails.logger.info verified_request?
    Rails.logger.info "**************************#{request.subdomain}"
  end

  def set_csrf_cookie
    if protect_against_forgery?
      cookies['X-CSRF-Token'] = form_authenticity_token
    end
  end

  def get_subdomain
     @subdomain = request.subdomain != '' ? request.subdomain(0).split('.')[0] : 'main'
   end

  def check_subdomain
    unless ["www",""].include?(request.subdomain.downcase) || request.original_fullpath.include?('map')
    redirect_to map_path and return
    end
  end

  protected

  def json_request?
    request.format.json?
  end

  def after_sign_in_path_for(*)
    session[:previous_url] || root_path
  end
end

class ApplicationController < ActionController::Base
  before_filter :authenticate! unless Rails.env == "development" || Rails.env == "test"
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :job_search

  def job_search
    @job_search ||= Job.search(params[:q])
  end

  protected

  def authenticate!
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["HTTP_AUTH_USERNAME"] && password == ENV["HTTP_AUTH_PASSWORD"]
    end
  end
end

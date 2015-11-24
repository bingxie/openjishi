class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def error_message_on
    Rails.application.config.error_message_position = 'up'
  end

  def error_message_down
    Rails.application.config.error_message_position = 'down'
  end
end

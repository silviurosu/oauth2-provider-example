class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def ping
    render text: 'PONG'
  end

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(_resource_or_scope)
    params[:return_url] || root_path
  end
end

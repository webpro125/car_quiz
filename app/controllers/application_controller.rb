class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

  def after_sign_up_path_for(resource)
    signed_in_root_path(resource)
  end
end

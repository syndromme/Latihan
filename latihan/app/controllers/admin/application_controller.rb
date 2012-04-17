class Admin::ApplicationController < ApplicationController
  protect_from_forgery

  layout "application"
  def require_admin_login
     if current_user.nil? || !current_user.is_admin?
       flash[:error] = "Only admins are permitted"
       redirect_to root_url
    else
       return current_user
    end
  end
end

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

    def require_is_admin
      if !current_user.admin?
        flash[:alert] = 'You are not admin'
        redirect_to root_path
      end

if current_user.admin?
  flash[:notice] = 'You are admin'
end
end
end

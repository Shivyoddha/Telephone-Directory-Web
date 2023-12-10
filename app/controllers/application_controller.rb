class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
      rails_admin.dashboard_path
  end
end

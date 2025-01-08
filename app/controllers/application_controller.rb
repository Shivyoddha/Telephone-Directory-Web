class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    if @user.email=='bsnl@nitk.edu.in'
      complaint_path
    else
      rails_admin_path
    end
  end
  before_action :set_paper_trail_whodunnit
end

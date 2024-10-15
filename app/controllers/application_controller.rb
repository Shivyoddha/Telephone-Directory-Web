class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
      rails_admin_path
  end
  before_action :set_paper_trail_whodunnit
end

class UtilityController < ApplicationController
  def history
    if current_user == nil || User.find(current_user.id).super_admin == false
      redirect_to root_url
    end
    @versions = PaperTrail::Version.order(created_at: :desc)
  end
end

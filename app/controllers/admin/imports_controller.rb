# app/controllers/admin/imports_controller.rb
class Admin::ImportsController < ApplicationController
  before_action :authenticate_admin!

  def new
  end

  def create
    file = params[:file]
    ImportService.new(file).perform if file.present?

    redirect_to rails_admin.dashboard_path, notice: 'Data imported successfully!'
  end
end

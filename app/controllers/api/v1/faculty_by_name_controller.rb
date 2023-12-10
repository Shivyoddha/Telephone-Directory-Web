class Api::V1::FacultyByNameController < ApplicationController
  def index
    if params[:name_prefix].present?
      @faculty_by_name = Faculty.where("name LIKE ?", "#{params[:name_prefix]}%")
    else
      @faculty_by_name = Faculty.all
    end

    render json: @faculty_by_name
  end
end

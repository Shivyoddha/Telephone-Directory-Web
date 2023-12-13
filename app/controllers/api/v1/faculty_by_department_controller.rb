class Api::V1::FacultyByDepartmentController < ApplicationController
  def index
    if params[:department_id].present?
      @faculty_by_department = Faculty.where(department_id: params[:department_id])
    else
      @faculty_by_department = Faculty.all
    end

    render json: @faculty_by_department
  end
end

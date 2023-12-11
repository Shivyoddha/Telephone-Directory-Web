class Api::V1::FacultyByAllController < ApplicationController
  def index
    name_condition = "name LIKE ?" if params[:name].present?
    designation_condition = "designation LIKE ?" if params[:designation].present?
    department_condition = "department_id = ?" if params[:department_id].present?

    conditions = [name_condition, designation_condition, department_condition].compact.join(" AND ")

    if conditions.present?
      @faculty_by_all = Faculty.where(conditions, "#{params[:name]}%", "#{params[:designation]}%", params[:department_id])
      render json: @faculty_by_all
    else
      render_all_faculty
    end
  end

  private

  def render_all_faculty
    @faculty_by_all = Faculty.all
    render json: @faculty_by_all
  end
end

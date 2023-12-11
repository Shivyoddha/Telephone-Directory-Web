class Api::V1::FacultyByAllController < ApplicationController
  def index
    name_condition = "name LIKE ?" if params[:name].present?
    designation_condition = "designation LIKE ?" if params[:designation].present?

    if name_condition || designation_condition
      conditions = [name_condition, designation_condition].compact.join(" AND ")
      @faculty_by_all = Faculty.where(conditions, "#{params[:name]}%", "#{params[:designation]}%")
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

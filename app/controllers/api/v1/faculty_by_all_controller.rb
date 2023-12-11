class Api::V1::FacultyByAllController < ApplicationController
  def index
    name_condition = "name LIKE ?" if params[:name].present? 
    designation_condition = "designation LIKE ?" if params[:designation].present? 
    department_condition = "department_id = ?" if params[:department_id].present? 

    if name_condition.present? && designation_condition.present? && department_condition.present?
      condition_all = [name_condition, designation_condition, department_condition].compact.join(" AND ")
    elsif name_condition.present? && designation_condition.present?
      condition_name_desig = [name_condition, designation_condition].compact.join(" AND ")
    elsif name_condition.present? && department_condition.present?
      condition_name_dep = [name_condition, department_condition].compact.join(" AND ")
    elsif designation_condition.present? && department_condition.present?  
      condition_dep_desig = [designation_condition, department_condition].compact.join(" AND ")
    end 

    if condition_all.present?
      @faculty_by_all = Faculty.where(condition_all, "#{params[:name]}%", "#{params[:designation]}%", params[:department_id])
      render json: @faculty_by_all
    elsif condition_name_desig.present?
      @faculty_by_all = Faculty.where(condition_name_desig, "#{params[:name]}%", "#{params[:designation]}%")
      render json: @faculty_by_all
    elsif condition_name_dep.present?
      @faculty_by_all = Faculty.where(condition_name_dep, "#{params[:name]}%", params[:department_id])
      render json: @faculty_by_all
    elsif condition_dep_desig.present?
      @faculty_by_all = Faculty.where(condition_dep_desig, "#{params[:name]}%", "#{params[:designation]}%", params[:department_id])
      render json: @faculty_by_all
    elsif name_condition.present?
      @faculty_by_all = Faculty.where(name_condition, "#{params[:name]}%")
      render json: @faculty_by_all
    elsif designation_condition.present?
      @faculty_by_all = Faculty.where(designation_condition, "#{params[:name]}%")
      render json: @faculty_by_all
    elsif department_condition.present?
      @faculty_by_all = Faculty.where(department_condition, "#{params[:name]}%")
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

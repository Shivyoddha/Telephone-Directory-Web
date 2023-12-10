class Api::V1::FacultyDesigController < ApplicationController
  def index
    if params[:designation].present?
      @faculty_desig = Faculty.where("designation LIKE ?", "#{params[:designation]}%")
    else
      @faculty_desig = Faculty.all
    end

    render json: @faculty_desig

  end
end

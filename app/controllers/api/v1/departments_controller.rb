class Api::V1::DepartmentsController < ApplicationController
  def index
    @departments = Department.all.where.not(name:'Backup')
    render json: @departments
  end
end




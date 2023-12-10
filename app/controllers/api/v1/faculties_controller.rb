
class Api::V1::FacultiesController < ApplicationController
  def index
    @faculties = Faculty.all
    render json: @faculties
  end
end
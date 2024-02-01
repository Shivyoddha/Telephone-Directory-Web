class Api::V1::DesignationsController < ApplicationController
  def index
    @designations = Designation.all
    render json: @designations
  end
end

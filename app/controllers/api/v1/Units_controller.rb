class Api::V1::UnitsController < ApplicationController
  def index
    @units = Unit.all
    render json: @units
  end
end
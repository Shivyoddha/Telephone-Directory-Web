class Api::V1::FacultiesController < ApplicationController
  def index
    @faculties = Faculty.includes(:department, :designation)
                         .where.not(departments: { name: 'Backup' })
                         .order("departments.custom_order ASC, faculties.custom_order ASC, designations.title ASC, faculties.joining_date ASC, faculties.name ASC")

    render json: @faculties, methods: [:image_url]
  end
end

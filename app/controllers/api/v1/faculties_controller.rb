class Api::V1::FacultiesController < ApplicationController
  def index
    @faculties = Faculty.includes(:department).where.not(departments: { name: 'Backup' })
                     .order("departments.custom_order ASC,faculties.custom_order ASC, faculties.designation_id ASC, faculties.joining_date ASC, faculties.name ASC")

    render json: @faculties, methods: [:image_url]
  end
end

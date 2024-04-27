class Api::V1::FacultiesController < ApplicationController
  def index
    faculties = Faculty.includes(:department)
                      .where.not(departments: { name: 'Backup' })
                      .order("departments.custom_order ASC, faculties.custom_order ASC, faculties.designation_id ASC, faculties.joining_date ASC, faculties.name ASC")

    sorted_faculties = faculties.sort_by do |faculty|
      [
        faculty.department.custom_order,
        faculty.custom_order,
        faculty.designation_id,
        faculty.joining_date,
        faculty.name
      ]
    end

    render json: sorted_faculties, methods: [:image_url]
  end
end

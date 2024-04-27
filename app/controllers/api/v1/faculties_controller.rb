class Api::V1::FacultiesController < ApplicationController
  def index
    faculties = Faculty.includes(:department)
                      .where.not(departments: { name: 'Backup' })
                      .order("departments.custom_order ASC, faculties.custom_order ASC, faculties.designation_id ASC, faculties.joining_date ASC, faculties.name ASC")

    # Group faculties by department
    faculties_by_department = faculties.group_by { |faculty| faculty.department }

    # Sort departments by custom order
    sorted_departments = faculties_by_department.keys.sort_by { |department| department.custom_order }

    # Construct sorted result array
    sorted_faculties = sorted_departments.map do |department|
      faculties_for_department = faculties_by_department[department]

      # Sort faculties within department
      sorted_faculties_for_department = faculties_for_department.sort_by do |faculty|
        [
          faculty.custom_order,
          faculty.designation_id,
          faculty.joining_date,
          faculty.name
        ]
      end

      { department: department, faculties: sorted_faculties_for_department }
    end

    render json: sorted_faculties, methods: [:image_url]
  end
end

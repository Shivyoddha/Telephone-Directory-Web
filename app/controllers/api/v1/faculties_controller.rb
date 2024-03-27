
# class Api::V1::FacultiesController < ApplicationController
#   def index
#     @faculties = Faculty.all

#     render json: @faculties
#   end
# end

# class Api::V1::FacultiesController < ApplicationController
#   def index
#     @faculties = Faculty.all
#     render json: @faculties.as_json(only: [:id, :name, :email], methods: [:profile_image_url])
#   end
# end



class Api::V1::FacultiesController < ApplicationController
  def index
    @faculties = Faculty.includes(:department).where.not(departments: { name: 'Backup' })
                     .order("departments.custom_order ASC, faculties.designation_id ASC, faculties.joining_date ASC, faculties.name ASC")

    render json: @faculties, methods: [:image_url]
  end
end

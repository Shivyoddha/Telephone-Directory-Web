
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
    @faculties = Faculty.all

    
  @faculties = @faculties.joins(:department).where.not(departments: { name: 'Backup' }).order("custom_order ASC, designation_id ASC, joining_date ASC")
  render json: @faculties, methods: [:image_url]
  end
end

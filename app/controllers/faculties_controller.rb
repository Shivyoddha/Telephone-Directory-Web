class FacultiesController < ApplicationController
  def index
    @filterrific = initialize_filterrific(
          Faculty,
          params[:filterrific],
          select_options: {
            with_department_id: Department.pluck(:name, :id).sort_by(&:first),
            sub_directory_id: SubDirectory.pluck(:title, :id)
          }
        ) or return

        faculties = @filterrific.find.distinct.order(:custom_order, :joining_date, :name)
        @faculties_by_department = faculties.group_by { |faculty| faculty.department.name }

        @departments = Department.order(:custom_order, :name)

        respond_to do |format|
          format.html
          format.js
        end
  end

  def show
  end

  def print
    @user = User.find(params[:user_id])
    @faculties = Faculty.all
    @faculties_by_department = @faculties.group_by { |faculty| faculty.department.name }
    if @user.super_admin?
      @departments = Department.order(:custom_order, :name)
    else
      @departments = Department.where(id: @user.department_ids).order(:custom_order, :name)
    end
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: 'Telephone Directory Data',
               template: 'faculties/alldata',
               layout: 'layouts/pdf',
               disposition: 'inline',
               margin: { top: 0, bottom: 0, left: 0, right: 0 },
               locals: { faculties: @faculties, user: @user }
      end
    end
  end

  def new
    @faculty = Faculty.new
  end

  def edit
  end

  def create
    @faculty = Faculty.new(faculty_params)

    respond_to do |format|
      if @faculty.save
        format.html { redirect_to faculty_url(@faculty), notice: "Faculty was successfully created." }
        format.json { render :show, status: :created, location: @faculty }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @faculty.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @faculty.update(faculty_params)
        format.html { redirect_to faculty_url(@faculty), notice: "Faculty was successfully updated." }
        format.json { render :show, status: :ok, location: @faculty }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @faculty.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @faculty.destroy

    respond_to do |format|
      format.html { redirect_to faculties_url, notice: "Faculty was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_faculty
      @faculty = Faculty.find(params[:id])
    end

    def faculty_params
      params.require(:faculty).permit(:name, :phoneno, :email, :telephone, :site_name, :joining_date, :profile, :department_id, :search_designation)
    end

end

class SignificantProjectsController < ApplicationController
  before_action :set_significant_project, only: %i[ show edit update destroy ]

  # GET /significant_projects or /significant_projects.json
  def index
    @significant_projects = SignificantProject.all
  end

  # GET /significant_projects/1 or /significant_projects/1.json
  def show
  end

  # GET /significant_projects/new
  def new
    @significant_project = SignificantProject.new
  end

  # GET /significant_projects/1/edit
  def edit
  end

  # POST /significant_projects or /significant_projects.json
  def create
    @significant_project = SignificantProject.new(significant_project_params)

    respond_to do |format|
      if @significant_project.save
        format.html { redirect_to significant_project_url(@significant_project), notice: "Significant project was successfully created." }
        format.json { render :show, status: :created, location: @significant_project }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @significant_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /significant_projects/1 or /significant_projects/1.json
  def update
    respond_to do |format|
      if @significant_project.update(significant_project_params)
        format.html { redirect_to significant_project_url(@significant_project), notice: "Significant project was successfully updated." }
        format.json { render :show, status: :ok, location: @significant_project }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @significant_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /significant_projects/1 or /significant_projects/1.json
  def destroy
    @significant_project.destroy

    respond_to do |format|
      format.html { redirect_to significant_projects_url, notice: "Significant project was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_significant_project
      @significant_project = SignificantProject.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def significant_project_params
      params.require(:significant_project).permit(:title)
    end
end

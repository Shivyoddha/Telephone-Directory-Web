class AcademicBackgroundsController < ApplicationController
  before_action :set_academic_background, only: %i[ show edit update destroy ]

  # GET /academic_backgrounds or /academic_backgrounds.json
  def index
    @academic_backgrounds = AcademicBackground.all
  end

  # GET /academic_backgrounds/1 or /academic_backgrounds/1.json
  def show
  end

  # GET /academic_backgrounds/new
  def new
    @academic_background = AcademicBackground.new
  end

  # GET /academic_backgrounds/1/edit
  def edit
  end

  # POST /academic_backgrounds or /academic_backgrounds.json
  def create
    @academic_background = AcademicBackground.new(academic_background_params)

    respond_to do |format|
      if @academic_background.save
        format.html { redirect_to academic_background_url(@academic_background), notice: "Academic background was successfully created." }
        format.json { render :show, status: :created, location: @academic_background }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @academic_background.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /academic_backgrounds/1 or /academic_backgrounds/1.json
  def update
    respond_to do |format|
      if @academic_background.update(academic_background_params)
        format.html { redirect_to academic_background_url(@academic_background), notice: "Academic background was successfully updated." }
        format.json { render :show, status: :ok, location: @academic_background }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @academic_background.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /academic_backgrounds/1 or /academic_backgrounds/1.json
  def destroy
    @academic_background.destroy

    respond_to do |format|
      format.html { redirect_to academic_backgrounds_url, notice: "Academic background was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_academic_background
      @academic_background = AcademicBackground.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def academic_background_params
      params.require(:academic_background).permit(:degree, :college, :year)
    end
end

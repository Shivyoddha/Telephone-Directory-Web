class ComplaintsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_complaint, only: [:show, :edit, :update, :destroy, :update_status, :update_bsnl_status]

  def index
    @complaints = Complaint.all
    @unresolved_complaints = Complaint.unresolved
    @resolved_complaints = Complaint.resolved
    @unique_telephones = Complaint.distinct.pluck(:telephone)

    # Data for graphs
    @monthly_stats = complaints_monthly_stats
    @telephone_stats = complaints_by_telephone
    @telephone_complaint_counts = complaint_counts_by_telephone
  end

  def show_telephone_stats
    if params[:telephone].present?
      complaints = Complaint.where(telephone: params[:telephone])
                            .order(created_at: :asc)
                            .map { |c| (c.resolution_time || 0) / 1.hour }
      render json: complaints
    else
      render json: { error: 'Telephone parameter is required' }, status: :unprocessable_entity
    end
  end

  def new
    @complaint = Complaint.new
  end

  # GET /complaints/1/edit
  def edit
  end

  def show
  end

  # POST /complaints or /complaints.json
  def create
    @complaint = Complaint.new(complaint_params)
    @complaint.status = false
    respond_to do |format|
      if @complaint.save
        format.html { redirect_to complaints_path, notice: "Complaint was successfully created." }
        format.json { render :show, status: :created, location: @complaint }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @complaint.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_status
    @complaint.update(status: true, status_changed_at: Time.current)
    respond_to do |format|
      format.html { redirect_to complaints_path, notice: 'Status updated successfully.' }
      format.js
    end
  end

  def update_bsnl_status
    @complaint.update(bsnlstatus: true, bsnlstatus_changed_at: Time.current)
    respond_to do |format|
      format.html { redirect_to complaints_path, notice: 'BSNL status updated successfully.' }
      format.js
    end
  end

  private

  def calculate_average(times)
    return 0 if times.empty?
    times.sum / times.length.to_f
  end

  def complaints_monthly_stats
    # Get the date range
    start_date = Complaint.minimum(:created_at)&.beginning_of_month || Time.current.beginning_of_month
    end_date = Complaint.maximum(:created_at)&.end_of_month || Time.current.end_of_month
    
    # Generate array of months
    months = []
    current_date = start_date
    while current_date <= end_date
      months << current_date
      current_date = current_date + 1.month
    end

    @unique_telephones.map do |telephone|
      {
        telephone: telephone,
        data: months.map do |month|
          complaints = Complaint.resolved
                              .where(telephone: telephone)
                              .where(created_at: month.beginning_of_month..month.end_of_month)
          resolution_times = complaints.map(&:resolution_time).compact.map { |t| t / 1.hour }
          {
            month: month.strftime('%B %Y'),
            average_time: calculate_average(resolution_times)
          }
        end
      }
    end
  end

  def telephone_monthly_stats(telephone_no)
    start_date = Complaint.where(telephone: telephone_no).minimum(:created_at)&.beginning_of_month || Time.current.beginning_of_month
    end_date = Complaint.where(telephone: telephone_no).maximum(:created_at)&.end_of_month || Time.current.end_of_month
    
    current_date = start_date
    stats = {}
    
    while current_date <= end_date
      month_range = current_date.beginning_of_month..current_date.end_of_month
      complaints = Complaint.resolved
                          .where(telephone: )
                          .where(created_at: month_range)
      
      resolution_times = complaints.map(&:resolution_time).compact.map { |t| t / 1.hour }
      stats[current_date.strftime('%B %Y')] = calculate_average(resolution_times)
      
      current_date = current_date + 1.month
    end
    
    stats
  end

  def complaints_by_telephone
    Complaint.resolved.group(:telephone) do |complaints|
              resolution_times = complaints.map(&:resolution_time).compact.map { |t| t / 1.hour }
              calculate_average(resolution_times)
            end
  end

  def complaint_counts_by_telephone
    total = Complaint.group(:telephone).count
    resolved = Complaint.resolved.group(:telephone).count
    unresolved = Complaint.unresolved.group(:telephone).count
    
    @unique_telephones.map do |telephone|
      {
        telephone: telephone,
        total: total[telephone] || 0,
        resolved: resolved[telephone] || 0,
        unresolved: unresolved[telephone] || 0
      }
    end
  end

  def set_complaint
    @complaint = Complaint.find(params[:id])
  end

  def complaint_params
    params.require(:complaint).permit(:telephone, :status, :bsnlstatus, kind: [])
  end
end
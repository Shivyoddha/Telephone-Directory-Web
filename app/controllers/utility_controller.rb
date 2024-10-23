class UtilityController < ApplicationController
  def history
    if current_user == nil || User.find(current_user.id).super_admin == false
      redirect_to root_url
    end
    @versions = PaperTrail::Version.order(created_at: :desc)
  end


  def import_interface
    @models = [Faculty, Department, SubDirectory]
    @latest_import_errors = session.delete(:import_errors)
  end

  def import
    if params[:file].nil?
      redirect_to import_interface_path, alert: "Please select a file to import"
      return
    end

    model_name = params[:model_name]
    model = model_name.constantize
    
    import_errors = []
    imported_count = 0
    
    begin
      # First, read and process headers
      headers = CSV.read(params[:file].path, encoding: 'utf-8').first
      
      # Skip the first row (headers) when processing data
      CSV.foreach(params[:file].path, headers: true, encoding: 'utf-8').with_index(2) do |row, line_num|
        begin
          next if row.to_h.values.all?(&:nil?) # Skip empty rows
          process_import_row(row, model)
          imported_count += 1
        rescue StandardError => e
          import_errors << "Row #{line_num}: #{e.message}"
          raise ActiveRecord::Rollback if import_errors.size > 10
        end
      end

      if import_errors.any?
        session[:import_errors] = import_errors
        redirect_to import_interface_path, alert: "Import completed with #{import_errors.size} errors. Successfully imported #{imported_count} records."
      else
        redirect_to import_interface_path, notice: "Successfully imported #{imported_count} records"
      end
    rescue StandardError => e
      redirect_to import_interface_path, alert: "Error importing data: #{e.message}"
    end
  end

  private

  def process_import_row(row, model)
    hash = row.to_hash
    record_hash = process_csv_row(hash, model)
    
    # Find existing record or initialize new one
    record = if record_hash['id'].present?
               model.find_or_initialize_by(id: record_hash['id'])
             else
               model.new
             end

    # Assign attributes and save with validation
    record.assign_attributes(record_hash)
    record.save!
  end

  def process_csv_row(hash, model)
    cleaned_hash = {}
    department_info = nil
    
    hash.each do |key, value|
      next if key.nil? # Skip nil keys
  
      clean_key = key.gsub(/^\xEF\xBB\xBF/, '')
      next if value.nil? || value.to_s.strip == '-' || value.to_s.strip.empty?
  
      attribute_key = clean_key.underscore.gsub(/\s+/, '_')
      cleaned_hash[attribute_key] = value
    end
  
    # Ensure custom_order is set and is a number
    cleaned_hash['custom_order'] = get_next_custom_order(model) unless cleaned_hash['custom_order'].present? && cleaned_hash['custom_order'].to_s =~ /\A\d+\z/

    # Ensure unit exists (if this is a requirement)
    if model.column_names.include?('unit_id') && cleaned_hash['unit_id'].blank?
      raise "Unit must exist" # Raise error if unit is required but missing
    end
  
    # Handle department relationship (example)
    if model == Faculty && department_info
      cleaned_hash['department_id'] = department_info[:department_id]
    end
  
    # Parse date fields
    cleaned_hash['joining_date'] = parse_date(cleaned_hash['joining_date']) if cleaned_hash['joining_date']
  
    # Remove invalid attributes
    cleaned_hash.slice(*model.column_names)
  end

  def parse_date(date_string)
    return nil if date_string.blank?
    Date.parse(date_string)
  rescue Date::Error
    nil
  end

  def process_relationship_field(hash, key, value)
    return nil if value.blank?

    # Example: "Name [Department]" becomes ["Name", "Department"]
    match_data = key.match(/^(.*?)\s*\[(.*?)\]/)
    return nil unless match_data

    attribute, relation = match_data.captures
    
    case relation
    when "Department"
      department = Department.find_or_create_by!(name: value.strip)
      { department_id: department.id }
    when "Designation"
      designation = Designation.find_or_create_by!(title: value.strip)
      hash["designation_id"] = designation.id
      nil
    when "Position1"
      position = Position.find_or_create_by!(title: value.strip)
      hash["position1_id"] = position.id
      nil
    when "Position2"
      position = Position.find_or_create_by!(title: value.strip)
      hash["position2_id"] = position.id
      nil
    when "Unit"
      unit = Unit.find_or_create_by!(name: value.strip)
      hash["unit_id"] = unit.id
      nil
    when "Sub directory"
      sub_directory = SubDirectory.find_or_create_by!(title: value.strip)
      hash["sub_directory_id"] = sub_directory.id
      nil
    end
  end

  def get_next_custom_order(model)
    # Get the highest numeric value from existing custom_orders
    highest = model.pluck(:custom_order)
                  .compact
                  .map { |co| co.to_i }
                  .max || 0
    
    (highest + 1).to_i
  end

end

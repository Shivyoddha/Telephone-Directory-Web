# app/services/import_service.rb
require 'roo'

class ImportService
  def initialize(file)
    @file = file
  end

  def perform
    spreadsheet = Roo::Spreadsheet.open(@file.path)
    header = spreadsheet.row(1)

    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      process_row(row)
    end
  end

  private

  def process_row(row)
    # Implement your logic to process each row and update the database
    # For example: Model.create(row)
  end
end

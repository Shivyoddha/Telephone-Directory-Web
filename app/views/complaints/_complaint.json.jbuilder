json.extract! complaint, :id, :telephone, :kind, :status, :created_at, :updated_at
json.url complaint_url(complaint, format: :json)

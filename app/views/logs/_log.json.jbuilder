json.extract! log, :id, :response_code, :response_body, :exception, :resource_id, :created_at, :updated_at
json.url log_url(log, format: :json)

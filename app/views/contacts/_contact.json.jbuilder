json.extract! contact, :id, :address, :status, :created_at, :updated_at
json.url contact_url(contact, format: :json)

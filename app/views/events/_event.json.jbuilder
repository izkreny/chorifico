json.extract! event, :id, :name, :status, :type, :start, :end, :location, :description, :created_at, :updated_at
json.url event_url(event, format: :json)

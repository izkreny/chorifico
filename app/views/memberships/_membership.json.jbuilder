json.extract! membership, :id, :group_id, :user_id, :start, :end, :status, :created_at, :updated_at
json.url membership_url(membership, format: :json)

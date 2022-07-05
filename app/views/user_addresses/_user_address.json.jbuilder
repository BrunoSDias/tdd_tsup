json.extract! user_address, :id, :street, :number, :city, :state, :user_id, :created_at, :updated_at
json.url user_address_url(user_address, format: :json)

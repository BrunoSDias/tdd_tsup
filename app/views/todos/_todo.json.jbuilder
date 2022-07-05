json.extract! todo, :id, :title, :description, :completed, :date, :created_at, :updated_at
json.url todo_url(todo, format: :json)

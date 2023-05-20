json.extract! item, :id, :name, :price, :callories, :restaurant_id, :dish_id, :created_at, :updated_at
json.url item_url(item, format: :json)

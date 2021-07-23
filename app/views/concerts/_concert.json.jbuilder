json.extract! concert, :id, :date, :duration, :location, :attendance, :created_at, :updated_at
json.url concert_url(concert, format: :json)

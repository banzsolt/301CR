json.extract! award, :id, :game_id, :name, :image, :weekly, :min_rank, :created_at, :updated_at
json.url award_url(award, format: :json)
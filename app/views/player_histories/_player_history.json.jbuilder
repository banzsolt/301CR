json.extract! player_history, :id, :game_id, :player_id, :rank, :created_at, :updated_at
json.url player_history_url(player_history, format: :json)
json.extract! game_session, :id, :name, :players, :next_player_id, :finished, :created_at, :updated_at
json.url game_session_url(game_session, format: :json)
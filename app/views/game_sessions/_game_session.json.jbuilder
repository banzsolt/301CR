json.extract! game_session, :id, :game_id, :player_id, :won, :created_at, :updated_at
json.url game_session_url(game_session, format: :json)
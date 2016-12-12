json.extract! game_session_player, :id, :game_session_id, :player_id, :created_at, :updated_at
json.url game_session_player_url(game_session_player, format: :json)
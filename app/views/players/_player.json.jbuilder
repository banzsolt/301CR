json.extract! player, :id, :game_id, :email, :password_digest, :demographic, :created_at, :updated_at
json.url player_url(player, format: :json)
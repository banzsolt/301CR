json.extract! player, :id, :game_id, :email, :nickname, :demographic, :created_at, :updated_at, :public
json.url player_url(player, format: :json)
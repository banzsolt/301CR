class Game < ApplicationRecord

  has_many :awards
  has_many :game_sessions
  has_many :players
  has_many :player_histories

end

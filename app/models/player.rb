class Player < ApplicationRecord

  has_secure_password

  has_many :game_sessions
  has_many :player_histories
  has_many :player_awards

  belongs_to :game

end

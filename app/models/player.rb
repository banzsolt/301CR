class Player < ApplicationRecord

  has_secure_password

  has_many :player_histories, :dependent => :delete_all
  has_many :player_awards, :dependent => :delete_all
  has_many :game_session_players, :dependent => :delete_all

  belongs_to :game

end

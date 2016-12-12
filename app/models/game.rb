class Game < ApplicationRecord

  has_many :awards, :dependent => :delete_all
  has_many :game_sessions, :dependent => :delete_all
  has_many :players, :dependent => :delete_all
  has_many :player_histories, :dependent => :delete_all

end

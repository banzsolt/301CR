class GameSession < ApplicationRecord

  has_many :game_session_players, :dependent => :delete_all

  belongs_to :game

end

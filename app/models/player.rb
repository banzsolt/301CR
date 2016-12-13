class Player < ApplicationRecord

  has_secure_password

  has_many :player_histories, :dependent => :delete_all
  has_many :player_awards, :dependent => :delete_all
  has_many :game_session_players, :dependent => :delete_all

  has_many :game_sessions, through: :game_session_players
  has_many :awards, through: :player_awards

  belongs_to :game

  attr_accessor :win_count, :loss_count, :win_per_loss

  def count_score

    self.win_count = 0
    self.loss_count = 0
    self.win_per_loss = 0

    self.game_sessions.where('finished = ?', true).each do |game_session|
      player_data = game_session.game_session_players.where('player_id = ?', self.id).first

      if player_data.won
        self.win_count += 1
      else
        self.loss_count += 1
      end
    end

    if self.win_count != 0 && self.loss_count != 0
      self.win_per_loss = self.win_count / self.loss_count
    end


  end

end

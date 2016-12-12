class AccessController < ApplicationController

  def index

    game_id = 1
    if !params[:id].nil?
      game_id = params[:id]
    end

    @game = Game.find(game_id)
    @players = @game.players.where('public = ?', true)

    @players.each do |player|
      player.count_score
    end

    @players = @players.sort_by{|data| data.win_per_loss}

  end

  def player_info

    player_id = 1
    if !params[:id].nil?
      player_id = params[:id]
    end

    @player = Player.find(player_id)

  end

end

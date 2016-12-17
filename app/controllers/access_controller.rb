class AccessController < ApplicationController

  def index

    game_id = 1
    if !params[:id].nil?
      game_id = params[:id]
    end

    @game = Game.find(game_id)
    @players = @game.players.where('public = ?', true).order(win_loss: :desc).order(:loss)

  end

  def player_info

    player_id = 1
    if !params[:id].nil?
      player_id = params[:id]
    end

    @player = Player.find(player_id)

    gon.history_data = @player.player_histories.order(:created_at)

  end

end

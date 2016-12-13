class ApiController < ApplicationController

  before_action :authorised, :except => [:index]

  def index
  end

  def playerWon

    @player.win += 1;

    if @player.loss == 0
      @player.win_loss = @player.win
    else
      @player.win_loss = @player.win / @player.loss
    end

    @player.save

    render :json => @player, :except => :password_digest

  end

  def playerLost

    @player.loss += 1;

    if @player.loss == 0
      @player.win_loss = @player.win
    else
      @player.win_loss = @player.win / @player.loss
    end

    @player.save

    render :json => @player, :except => :password_digest

  end
end

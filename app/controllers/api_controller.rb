class ApiController < ApplicationController

  before_action :authorised, :except => [:index, :register, :player_info]

  def index
  end

  def playerWon

    check_game_session

    @player.win += 1;

    if @player.loss == 0
      @player.win_loss = @player.win
    else
      @player.win_loss = @player.win / @player.loss
    end

    if @player.save
      @game_session.finished = true
      @game_session.save
      render :json => @player, :except => :password_digest
    else
      render :json => {'error':'there was an error while trying to save the player'}
    end

  end

  def playerLost

    check_game_session

    @player.loss += 1;

    if @player.loss == 0
      @player.win_loss = @player.win
    else
      @player.win_loss = @player.win / @player.loss
    end

    if @player.save
      @game_session.finished = true
      @game_session.save
      render :json => @player, :except => :password_digest
    else
      render :json => {'error':'there was an error while trying to save the player'}
    end

  end

  def create_game_session

    game_session = GameSession.new

    if params[:game_id].nil?
      render :json => {'error': 'game_id missing from parameters'}
    end

    render :json => game_session

  end

  def register

    if request.headers['email'].nil? || request.headers['password'].nil?
      render :json => {'error': 'The header is missing either email or password'}
      return false
    end

    player = Player.where('email = ?', request.headers['email']).first
    if !player.nil?
      render :json => {'error': 'User with this email already registered'}
      return false
    end

    player = Player.new
    player.email = request.headers['email']
    player.password = request.headers['password']
    player.demographic = 'UK'
    if !params[:demographic].nil?
      player.demographic = params[:demographic]
    end

  end

  def player_info

    player_id = 1
    if !params[:player_id].nil?
      player_id = params[:player_id]
    end

    @player = Player.find(player_id)

    render :json => @player, :except => :password_digest

  end

  def high_score



  end

  private

    def check_game_session

      if params[:game_session_id].nil?
        render :json => {'error':'game_sessio_id missing from the parameters'}
        return false
      end

      @game_session = GameSession.find(params[:game_session_id])

      if @game_session.nil?
        render :json => {'error':'no game sessions with this ID'}
        return false
      end

      if @game_session.finished
        render :json => {'error': 'game session already finished'}
        return false
      end

    end

end

class ApiController < ApplicationController

  before_action :authorised, :except => [:index, :register, :player_info, :high_score]

  def index
  end

  def player_won

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
      render :json => @player, :except => [:password_digest, :created_at, :updated_at]
    else
      render :json => {'error':'there was an error while trying to save the player'}
    end

  end

  def player_lost

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
      render :json => @player, :except => [:password_digest, :created_at, :updated_at]
    else
      render :json => {'error':'there was an error while trying to save the player'}
    end

  end

  def create_game_session

    check_game_id

    game_session = GameSession.new
    game_session.game_id = params[:game_id]
    game_session.save

    render :json => game_session

  end

  def register

    if request.headers['email'].nil? || request.headers['password'].nil?
      render :json => {'error': 'The header is missing either email or password'}
      return false
    end

    check_game_id

    player = Player.where('email = ? AND game_id = ?', request.headers['email'], params[:game_id]).first
    if !player.nil?
      render :json => {'error': 'User already signed up to this game with this'}
      return false
    end

    player = Player.new
    player.email = request.headers['email']
    player.password = request.headers['password']
    player.demographic = 'UK'
    player.game_id = params[:game_id]
    if !params[:demographic].nil?
      player.demographic = params[:demographic]
    end

    render :json => player, :except => [:password_digest, :created_at, :updated_at]

  end

  def player_info

    player_id = 1
    if !params[:player_id].nil?
      player_id = params[:player_id]
    end

    @player = Player.find(player_id)

    render :json => {'player':@player, 'awards':@player.awards.uniq, 'player_history':@player.player_history}, :except => [:password_digest, :created_at, :updated_at]

  end

  def high_score

      check_game_id

      limit = 100
      demographic = ''
      if !params[:limit].nil?
        limit = params[:limit]
      end

      if !params[:demographic].nil?
        demographic = params[:demographic]
      end

      if demographic != ''
        players = @game.players.where('demographic = ?', demographic).order(win_loss: :desc).top(limit)
      else
        players = @game.players.order(win_loss: :desc).top(limit)
      end

      render :json => players, :except => [:password_digest, :created_at, :updated_at]

  end

  private

    def check_game_session

      if params[:game_session_id].nil?
        render :json => {'error':'game_session_id missing from the parameters'}
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

    def check_game_id

      if params[:game_id].nil?
        render :json => {'error': 'game_id missing from parameters'}
        return false
      end

      @game = Game.find(params[:game_id])

      if @game.nil?
        render :json => {'error': 'game with specified id does not exist'}
        return false
      end

    end

end

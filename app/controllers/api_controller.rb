class ApiController < ApplicationController

  before_action :authorised, :except => [:index, :register, :player_info, :high_score]

  def login

    render :json => @player, :except => [:password_digest, :created_at, :updated_at]

  end

  def index
  end

  def join_game_session

    if !check_game_session
      return
    end

    game_session_player = GameSessionPlayer.new
    game_session_player.game_session_id = @game_session.id
    game_session_player.player_id = @player.id
    game_session_player.save

    render :json => game_session_player

  end


  def player_won

    if !check_game_session
      return
    end

    @player.win += 1;

    if @player.loss == 0
      @player.win_loss = @player.win
    else
      @player.win_loss = @player.win / @player.loss
    end

    if @player.save

      @game_session.finished = true
      @game_session.save

      # set the other players score to win
      game_session_winner = GameSessionPlayer.where('game_session_id = ? AND player_id != ?', @game_session.id, @player.id).first
      loser_player = game_session_winner.player

      loser_player.loss += 1
      loser_player.win_loss = loser_player.win / loser_player.loss
      loser_player.save


      render :json => @player, :except => [:password_digest, :created_at, :updated_at]
    else
      render :json => {'error':'there was an error while trying to save the player'}
    end

  end

  def player_lost

    if !check_game_session
      return
    end

    @player.loss += 1
    @player.win_loss = @player.win / @player.loss

    if @player.save
      @game_session.finished = true
      @game_session.save

      # set the other players score to win
      game_session_winner = GameSessionPlayer.where('game_session_id = ? AND player_id != ?', @game_session.id, @player.id).first
      winner_player = game_session_winner.player
      game_session_winner.won = true
      game_session_winner.save

      winner_player.win += 1;
      if winner_player.loss == 0
        winner_player.win_loss = winner_player.win
      else
        winner_player.win_loss = winner_player.win / winner_player.loss
      end
      winner_player.save

      render :json => @player, :except => [:password_digest, :created_at, :updated_at]
    else
      render :json => {'error':'there was an error while trying to save the player'}
    end

  end

  def create_game_session

    game_session = GameSession.new
    game_session.game_id = @player.game_id
    game_session.save

    game_session_player = GameSessionPlayer.new
    game_session_player.game_session_id = game_session.id
    game_session_player.player_id = @player.id
    game_session_player.save

    render :json => game_session

  end

  def register

    if !check_game_id
      return
    end

    authenticate_or_request_with_http_basic do |username, password|
      player = Player.where('email = ? AND game_id = ?', request.headers['email'], @game.id).first
      if !player.nil?
        render :json => {'error': 'User already signed up to this game with this'}
        return false
      end

      player = Player.new
      player.email = username
      player.password = password
      player.demographic = 'UK'
      player.game_id = @game.id
      player.nickname = params[:nickname]
      if !params[:demographic].nil?
        player.demographic = params[:demographic]
      end

      player.save

      render :json => player, :except => [:password_digest, :created_at, :updated_at]
    end

  end


  def player_info

    player_id = 1
    if !params[:player_id].nil?
      player_id = params[:player_id]
    end

    @player = Player.find(player_id)

    render :json => {'player':@player, 'awards':@player.awards.uniq, 'player_history':@player.player_histories}, :except => [:password_digest, :created_at, :updated_at]

  end

  def high_score

      if !check_game_id
        return
      end

      limit = 100
      demographic = ''
      if !params[:limit].nil?
        limit = params[:limit]
      end

      if !params[:demographic].nil?
        demographic = params[:demographic]
      end

      if !params[:type].nil?




      else
        if demographic != ''
          players = @game.players.where('demographic = ?', demographic).order(win_loss: :desc).top(limit)
        else
          players = @game.players.order(win_loss: :desc).first(limit)
        end
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

      puts "GAME SESSION ISSSSSSSSS"
      puts @game_session

      if @game_session.nil?
        render :json => {'error':'no game sessions with this ID'}
        return false
      end

      if @game_session.finished
        render :json => {'error': 'game session already finished'}
        return false
      end

      return true

    end


end

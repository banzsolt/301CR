class ApplicationController < ActionController::Base
  protect_from_forgery unless: -> { request.format.json? }

  private

  def authorised

    if !check_game_id
      return false
    end

    authenticate_or_request_with_http_basic do |username, password|
      player = Player.where('email = ? AND game_id = ?', username, @game.id).first
      if player.nil?
        render :json => {'error': 'User not found'}
        return false
      end

      if player.authenticate(password)
        @player = player
        return true
      else
        render :json => {'error': 'Password incorrect'}
        return false
      end
    end

  end

  def check_game_id

    if request.headers['game-id'].nil?
      render :json => {'error':'game-id missing from header params'}
      puts "THIIIIIIIIIIIIS"
      return false
    end

    puts "THIAAAAAAS"
    @game = Game.find(request.headers['game-id'])


    if @game.nil?
      render :json => {'error':'game with specified id does not exist'}
      return false
    end

    return true

  end

end

class ApplicationController < ActionController::Base
  protect_from_forgery unless: -> { request.format.json? }

  private

  def authorised

    if request.headers['email'].nil? || request.headers['password'].nil?
      render :json => {'error': 'The header is missing either email or password'}
      return false
    end

    player = Player.where('email = ?', request.headers['email']).first
    if player.nil?
      render :json => {'error': 'Could not find user with email specified'}
      return false
    end

    if player.authenticate(request.headers['password'])
      @player = player
      return true
    else
      render :json => {'error': 'Password incorrect'}
    end


  end

end

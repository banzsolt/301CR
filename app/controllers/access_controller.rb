class AccessController < ApplicationController

  def index

    game_id = 1
    if !params[:id].nil?
      game_id = params[:id]
    end



  end

end

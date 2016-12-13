class V1::ApiController < V1::BaseController

  def high_score

    render :json => true
    return

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
      players = @game.players.order(win_loss: :desc).first(limit)
    end

    render :json => players, :except => [:password_digest, :created_at, :updated_at]

  end

end

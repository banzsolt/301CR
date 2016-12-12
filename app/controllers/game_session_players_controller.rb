class GameSessionPlayersController < ApplicationController
  before_action :set_game_session_player, only: [:show, :edit, :update, :destroy]

  # GET /game_session_players
  # GET /game_session_players.json
  def index
    @game_session_players = GameSessionPlayer.all
  end

  # GET /game_session_players/1
  # GET /game_session_players/1.json
  def show
  end

  # GET /game_session_players/new
  def new
    @game_session_player = GameSessionPlayer.new
  end

  # GET /game_session_players/1/edit
  def edit
  end

  # POST /game_session_players
  # POST /game_session_players.json
  def create
    @game_session_player = GameSessionPlayer.new(game_session_player_params)

    respond_to do |format|
      if @game_session_player.save
        format.html { redirect_to @game_session_player, notice: 'Game session player was successfully created.' }
        format.json { render :show, status: :created, location: @game_session_player }
      else
        format.html { render :new }
        format.json { render json: @game_session_player.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /game_session_players/1
  # PATCH/PUT /game_session_players/1.json
  def update
    respond_to do |format|
      if @game_session_player.update(game_session_player_params)
        format.html { redirect_to @game_session_player, notice: 'Game session player was successfully updated.' }
        format.json { render :show, status: :ok, location: @game_session_player }
      else
        format.html { render :edit }
        format.json { render json: @game_session_player.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /game_session_players/1
  # DELETE /game_session_players/1.json
  def destroy
    @game_session_player.destroy
    respond_to do |format|
      format.html { redirect_to game_session_players_url, notice: 'Game session player was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game_session_player
      @game_session_player = GameSessionPlayer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_session_player_params
      params.require(:game_session_player).permit(:game_session_id, :player_id)
    end
end

class PlayerHistoriesController < ApplicationController
  before_action :set_player_history, only: [:show, :edit, :update, :destroy]

  # GET /player_histories
  # GET /player_histories.json
  def index
    @player_histories = PlayerHistory.all
  end

  # GET /player_histories/1
  # GET /player_histories/1.json
  def show
  end

  # GET /player_histories/new
  def new
    @player_history = PlayerHistory.new
  end

  # GET /player_histories/1/edit
  def edit
  end

  # POST /player_histories
  # POST /player_histories.json
  def create
    @player_history = PlayerHistory.new(player_history_params)

    respond_to do |format|
      if @player_history.save
        format.html { redirect_to @player_history, notice: 'Player history was successfully created.' }
        format.json { render :show, status: :created, location: @player_history }
      else
        format.html { render :new }
        format.json { render json: @player_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /player_histories/1
  # PATCH/PUT /player_histories/1.json
  def update
    respond_to do |format|
      if @player_history.update(player_history_params)
        format.html { redirect_to @player_history, notice: 'Player history was successfully updated.' }
        format.json { render :show, status: :ok, location: @player_history }
      else
        format.html { render :edit }
        format.json { render json: @player_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /player_histories/1
  # DELETE /player_histories/1.json
  def destroy
    @player_history.destroy
    respond_to do |format|
      format.html { redirect_to player_histories_url, notice: 'Player history was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_player_history
      @player_history = PlayerHistory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def player_history_params
      params.require(:player_history).permit(:game_id, :player_id, :rank)
    end
end

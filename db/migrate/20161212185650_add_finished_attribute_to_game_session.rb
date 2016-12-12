class AddFinishedAttributeToGameSession < ActiveRecord::Migration[5.0]
  def change
    add_column :game_sessions, :finished, :boolean, default: false
    remove_column :game_sessions, :won
    add_column :game_session_players, :won, :boolean, default: false
  end
end

class DeletePlayersFromGameSession < ActiveRecord::Migration[5.0]
  def change
    remove_column :game_sessions, :player_ids
  end
end

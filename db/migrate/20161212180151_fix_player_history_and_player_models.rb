class FixPlayerHistoryAndPlayerModels < ActiveRecord::Migration[5.0]
  def change
    remove_column :player_histories, :game_id
    add_column :players, :public, :boolean, default: true
    remove_column :game_sessions, :player_id
    add_column :game_sessions, :player_ids, :integer, array: true, default: []
  end
end

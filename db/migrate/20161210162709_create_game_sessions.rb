class CreateGameSessions < ActiveRecord::Migration[5.0]
  def change
    create_table :game_sessions do |t|
      t.integer :game_id
      t.integer :player_id
      t.boolean :won

      t.timestamps
    end
  end
end

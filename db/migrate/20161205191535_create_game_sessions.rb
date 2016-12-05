class CreateGameSessions < ActiveRecord::Migration[5.0]
  def change
    create_table :game_sessions do |t|
      t.string :name
      t.integer :players
      t.integer :next_player_id
      t.boolean :finished

      t.timestamps
    end
  end
end

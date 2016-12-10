class CreatePlayerHistories < ActiveRecord::Migration[5.0]
  def change
    create_table :player_histories do |t|
      t.integer :game_id
      t.integer :player_id
      t.integer :rank

      t.timestamps
    end
  end
end

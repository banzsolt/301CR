class CreatePlayerAwards < ActiveRecord::Migration[5.0]
  def change
    create_table :player_awards do |t|
      t.integer :player_id
      t.integer :award_id

      t.timestamps
    end
  end
end

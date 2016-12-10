class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.integer :game_id
      t.string :email
      t.string :password_digest
      t.string :demographic

      t.timestamps
    end
  end
end

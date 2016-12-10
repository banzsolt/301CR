class CreateAwards < ActiveRecord::Migration[5.0]
  def change
    create_table :awards do |t|
      t.integer :game_id
      t.string :name
      t.string :image
      t.boolean :weekly
      t.integer :min_rank

      t.timestamps
    end
  end
end

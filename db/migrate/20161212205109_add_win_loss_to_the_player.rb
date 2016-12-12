class AddWinLossToThePlayer < ActiveRecord::Migration[5.0]
  def change
    add_column :players, :win, :integer, :default => 0
    add_column :players, :loss, :integer, :default => 0
    add_column :players, :win_loss, :float, :default => 0
  end
end

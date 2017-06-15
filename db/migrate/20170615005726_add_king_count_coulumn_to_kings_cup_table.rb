class AddKingCountCoulumnToKingsCupTable < ActiveRecord::Migration[5.1]
  def change
    add_column :kings_cups, :king_count, :integer, :default => 0
  end
end

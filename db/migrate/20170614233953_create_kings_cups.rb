class CreateKingsCups < ActiveRecord::Migration[5.1]
  def change
    create_table :kings_cups do |t|
      t.integer :userID
      t.text :options, array: true, default: []
      t.timestamps
    end
  end
end

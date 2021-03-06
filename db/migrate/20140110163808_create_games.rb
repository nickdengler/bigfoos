class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :num_players, limit: 4, default: 4, null: false
      t.integer :num_teams, limit: 4, default: 2, null: false
      t.text :stats

      t.timestamps
    end
  end
end

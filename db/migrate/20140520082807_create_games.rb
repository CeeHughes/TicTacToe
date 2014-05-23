class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :player_x_id
      t.integer :player_o_id
      t.string :result
      t.integer :player_invited_id
      t.string :invitation_status

      t.timestamps
    end
  end
end

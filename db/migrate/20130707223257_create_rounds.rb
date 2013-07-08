class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.integer :pilot_id
      t.integer :tour_id
    end
  end
end

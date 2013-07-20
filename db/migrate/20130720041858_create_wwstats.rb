class CreateWwstats < ActiveRecord::Migration
  def change
    create_table :wwstats do |t|
      t.integer :pilot_id
      t.integer :tour_id
      t.integer :tournament_id
      t.integer :seconds, :default => 0
      t.integer :cuts, :default => 0
      t.boolean :uncut
      t.boolean :non_engagement
      t.boolean :crossed_line
      t.boolean :rpm_penalty
    end
  end
end

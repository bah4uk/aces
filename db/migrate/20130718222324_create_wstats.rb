class CreateWstats < ActiveRecord::Migration
  def change
    create_table :wstats do |t|
      t.integer :pilot_id
      t.integer :tour_id
      t.integer :tournament_id
      t.integer :seconds, :default => 0
      t.integer :cuts, :default => 0
      t.boolean :uncut
      t.boolean :non_engagement
      t.boolean :crossed_line
      t.boolean :ground_start
      t.boolean :landed
      t.integer :ground_targets, :default => 0
      # optional points
      t.boolean :cable_wires
      t.boolean :guns
      t.boolean :pilot_on_board
      t.boolean :wing_structure
      t.boolean :biplane
      t.boolean :four_stroke_engine
      t.integer :rpm
      t.string  :prop_ratio
      t.integer :judge_id
    end
  end
end

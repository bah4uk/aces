class CreateCompetitions < ActiveRecord::Migration
  def change
    create_table :competitions do |t|
      t.integer :pilot_id
      t.integer :tournament_id
    end
  end
end

class CreateTours < ActiveRecord::Migration
  def change
    create_table :tours do |t|
      t.integer  :tournament_id

      t.timestamps
    end
  end
end

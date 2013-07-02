class CreatePlanes < ActiveRecord::Migration
  def change
    create_table :planes do |t|
      t.integer :pilot_id
      t.string  :model
      t.string  :frequency
      t.string  :type

      t.timestamps
    end
  end
end

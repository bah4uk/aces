class CreatePilots < ActiveRecord::Migration
  def change
    create_table :pilots do |t|
      t.integer :user_id
      t.integer :country_id
      t.string  :name
      t.string  :status, :default => "not_approved"

      t.timestamps
    end
  end
end

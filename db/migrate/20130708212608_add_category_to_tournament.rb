class AddCategoryToTournament < ActiveRecord::Migration
  def change
    add_column :tournaments, :category_id, :integer
  end
end

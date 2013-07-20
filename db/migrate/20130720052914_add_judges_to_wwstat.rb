class AddJudgesToWwstat < ActiveRecord::Migration
  def change
    add_column :wwstats, :judge, :string
  end
end

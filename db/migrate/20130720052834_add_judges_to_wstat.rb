class AddJudgesToWstat < ActiveRecord::Migration
  def change
    add_column :wstats, :judge, :string
  end
end

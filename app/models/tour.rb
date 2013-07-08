class Tour < ActiveRecord::Base
  belongs_to :tournament
  has_and_belongs_to_many :pilots, :join_table => :rounds

end

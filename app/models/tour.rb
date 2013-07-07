class Tour < ActiveRecord::Base
  belongs_to :tournament
  has_many   :pilots

end

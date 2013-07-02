class Plane < ActiveRecord::Base
  belongs_to :pilot

  attr_accessible :pilot_id, :model, :frequency, :type

end

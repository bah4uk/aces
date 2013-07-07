class Tournament < ActiveRecord::Base
  has_many :tours
  has_many :pilots
end

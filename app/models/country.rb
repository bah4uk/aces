class Country < ActiveRecord::Base
  has_many :pilots
  attr_accessible :name
end

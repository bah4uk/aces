class Category < ActiveRecord::Base
  has_many :tournaments
  attr_accessible :name
end

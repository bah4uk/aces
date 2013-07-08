class Tournament < ActiveRecord::Base
  has_many :tours, :dependent => :destroy
  has_and_belongs_to_many :pilots, :join_table => :competitions

  attr_accessible :name
end

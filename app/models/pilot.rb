class Pilot < ActiveRecord::Base
  belongs_to :user
  belongs_to :country

  attr_accessible :user_id, :country_id, :name, :status
end

class Pilot < ActiveRecord::Base
  belongs_to :user
  belongs_to :country

  STATUSES = %w(not_approved approved)

  STATUSES.each do |name|
    const_set(name.upcase, name)
  end

  attr_accessible :user_id, :country_id, :name, :status
end

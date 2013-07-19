class Pilot < ActiveRecord::Base
  belongs_to :user
  belongs_to :country
  has_and_belongs_to_many :tours, :join_table => :rounds
  has_and_belongs_to_many :tournaments, :join_table => :competitions
  has_many :wstats, dependent: :destroy

  STATUSES = %w(not_approved approved)

  STATUSES.each do |name|
    const_set(name.upcase, name)
  end

  def tours_in(tournament)
    tours.where(:tournament_id => tournament.id).count
  end

  attr_accessible :user_id, :country_id, :name, :status
end

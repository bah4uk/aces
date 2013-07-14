class Tournament < ActiveRecord::Base
  has_many :tours, :dependent => :destroy
  has_and_belongs_to_many :pilots, :join_table => :competitions
  belongs_to :category

  attr_accessible :name, :category_id


  def pilots_per_round
    case category.name
      when "WWI"  then return 6
      when "WWII" then return 7
      when "S500" then return 7
    end
  end

  def rounds_per_pilot
    case category.name
      when "WWI"  then return 3
      when "WWII" then return 5
      when "S500" then return 3
    end
  end
end

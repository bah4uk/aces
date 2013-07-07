class Tool::Shuffle
  class << self
    def number_of_tours(num_of_pilots)
      extra_tours = num_of_pilots%7 == 0 ? false : true
      tours = num_of_pilots/7*5
      tours += 5 if extra_tours
      tours
    end

    def seed_plts
      return false if Pilot.count > 5
      ids = Country.all.map(&:id)
      ids.each do |country_id|
        name = Faker::Name.name
        Pilot.create!({ name: name, country_id: ids.sample })
      end
    end
  end
end

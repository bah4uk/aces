class Tool::Shuffle
  class << self
    def number_of_tours(num_of_pilots)
      extra_tours = num_of_pilots%7 == 0 ? false : true
      tours = num_of_pilots/7*5
      tours += 5 if extra_tours
      tours
    end

    def shuffle(tournament)
      tournament.tours.map(&:destroy)
      pilots = tournament.pilots
      number_of_tours(pilots.count).times do
        tournament.tours.create
      end

      tours = tournament.tours

      tours.each do |tour|
        ids = pilots.map(&:id).shuffle
        7.times do
          begin
            pilot = Pilot.find(ids.pop) rescue nil
            pp ids
          end while ( !pilot.nil? and !tour.pilots.include?(pilot) and pilot.tours.count > 4)

          tour.pilots.push(pilot) unless pilot.nil?
        end
      end
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

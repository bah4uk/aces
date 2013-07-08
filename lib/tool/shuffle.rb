class Tool::Shuffle

  PILOTS_PER_ROUND     = 7
  MIN_ROUNDS_PER_PILOT = 5

  class << self
    def number_of_rounds(num_of_pilots)
      num_of_pilots / PILOTS_PER_ROUND * MIN_ROUNDS_PER_PILOT + extra_rounds(num_of_pilots)[0]
    end

    def extra_rounds(num_of_pilots)
      case num_of_pilots%7
        when 1
          [1, [7,7,7,6,6]]
        when 2
          [2, [7,6,6,6,6]]
        when 3
          [3, [6,6,6,6,5]]
        when 4
          [3, [7,7,7,7,6]]
        when 5
          [4, [7,7,6,6,6]]
        when 6
          [5, [6,6,6,6,6]]
        else
          [0, [7,7,7,7,7]]
        end
    end

    def shuffle(tournament)
      create_rounds(tournament)
      num           = tournament.tours.count
      pilots_count  = tournament.pilots.count

      tournament.tours.each_with_index do |tour, index|
        count_var = 7

        if index >= num - 5
          count_var = extra_rounds(pilots_count)[1][index - (num - 5)]
        end

        pilots = tournament.pilots.shuffle.map{|plt| [plt.id, plt.tours.count]}.sort_by{|item| item[1]}.reverse
        pp pilots
        count_var.times do
          begin
            pilot = Pilot.find(pilots.pop[0]) rescue nil
          end while ( !pilot.nil? and (tour.pilots.count != count_var) and !tour.pilots.include?(pilot) and (pilot.tours.count == 5) )

          tour.pilots.push(pilot) unless pilot.nil?
        end
      end
      pp tournament.pilots.select{|plt| plt.tours.count < 5}.map(&:name)
    end

    def create_rounds(tournament)
      tournament.tours.destroy_all

      number_of_rounds(tournament.pilots.count).times do
        tournament.tours.create
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

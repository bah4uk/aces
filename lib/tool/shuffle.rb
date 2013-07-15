class Tool::Shuffle

  attr_accessor :tournament, :category, :num_of_pilots, :number_of_rounds,
                :pilots_per_round, :rounds_per_pilot

  def initialize(tournament)
    @tournament, @category = tournament, tournament.category.name
    @num_of_pilots    = tournament.pilots.count
    @pilots_per_round = tournament.pilots_per_round
    @rounds_per_pilot = tournament.rounds_per_pilot
    @number_of_rounds = num_of_pilots / pilots_per_round * rounds_per_pilot + extra_rounds[0]
  end

  def extra_rounds
    if category == "WWI"
      case num_of_pilots%pilots_per_round
        when 0 then return [0, 0]
        when 1 then return [1, 3]
        when 2 then return [1, 0]
        when 3 then return [2, 3]
        when 4 then return [2, 0]
        when 5 then return [3, 3]
      end
    end

    if category == "WWII"
      case num_of_pilots%pilots_per_round
        when 0 then return [0, 0]
        when 1 then return [1, 2]
        when 2 then return [2, 4]
        when 3 then return [3, 6]
        when 4 then return [3, 1]
        when 5 then return [4, 3]
        when 6 then return [5, 5]
      end
    end

    if category == "S500"
      case num_of_pilots%pilots_per_round
        when 0 then return [0, 0]
        when 1 then return [1, 4]
        when 2 then return [1, 1]
        when 3 then return [2, 5]
        when 4 then return [2, 2]
        when 5 then return [3, 6]
        when 6 then return [3, 3]
      end
    end
  end

  def shuffle
    create_tours

    tournament.tours.each_with_index do |tour, index|
      count_var = pilots_per_round

      if index >= number_of_rounds - extra_rounds[1]
        count_var = category == "WWI" ? 5 : 6
      end

      pilots = tournament.pilots.shuffle.map{|plt| [plt.id, plt.tours_in(tournament)]}.sort_by{|item| item[1]}.reverse
      count_var.times do
        begin
          pilot = Pilot.find(pilots.pop[0]) rescue nil
        end while ( !pilot.nil? and (tour.pilots.count != count_var) and !tour.pilots.include?(pilot) and (pilot.tours_in(tournament) == rounds_per_pilot) )

        tour.pilots.push(pilot) unless pilot.nil?
      end
    end
  end

  def create_tours
    tournament.tours.destroy_all

    number_of_rounds.times do
      tournament.tours.create
    end
  end
end

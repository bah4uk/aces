class Wwstat < ActiveRecord::Base
  belongs_to :pilot
  belongs_to :tour
  belongs_to :tournament

  attr_accessible :pilot_id, :tour_id, :tournament_id, :seconds, :cuts,
                  :uncut, :non_engagement, :crossed_line, :rpm_penalty

  def self.points_for(pilot_id, tour_id)
    s = pilot_tour(pilot_id, tour_id)
    s.main_pts
  end

  def self.pilot_tour(pilot_id, tour_id)
    where(pilot_id: pilot_id, tour_id: tour_id).first
  end

  def self.for_tournament(tournament_id)
    where(tournament_id: tournament_id)
  end

  def main_pts
    [pts_seconds, pts_cuts, pts_uncut, pts_non_engagement,
    pts_crossed_line, rpm_penalty].inject(:+)
  end

  #main points
  def pts_seconds;        (seconds / 3.0).ceil;      end
  def pts_cuts;           cuts*100;                  end
  def pts_uncut;          uncut? ? 50 : 0;           end
  def pts_non_engagement; non_engagement? ? -50 : 0; end
  def pts_crossed_line;   crossed_line? ? -200 : 0;  end
  def rpm_penalty;        rpm_penalty? ? -50 : 0;    end
end

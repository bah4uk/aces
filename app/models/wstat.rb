class Wstat < ActiveRecord::Base
  belongs_to :pilot
  belongs_to :tour
  belongs_to :tournament

  attr_accessible :pilot_id, :tour_id, :tournament_id, :seconds, :cuts, :uncut, :non_engagement, :crossed_line, :ground_start, :landed,
                  :ground_targets, :cable_wires, :guns, :pilot_on_board, :wing_structure, :biplane, :four_stroke_engine,
                  :rpm, :prop_ratio, :judge_id, :judge


  def self.points_for(pilot_id, tour_id)
    s = pilot_tour(pilot_id, tour_id)
    s.main_pts + s.optional_pts
  end

  def self.pilot_tour(pilot_id, tour_id)
    where(pilot_id: pilot_id, tour_id: tour_id).first
  end

  def self.for_tournament(tournament_id)
    where(tournament_id: tournament_id)
  end

  def self.pts_for(pilot_id)
    where(pilot_id: pilot_id).map{|stat| stat.main_pts + stat.optional_pts}.inject(:+)
  end

  def main_pts
    [pts_seconds, pts_cuts, pts_uncut, pts_non_engagement, pts_crossed_line,
    pts_ground_start, pts_landed, pts_ground_targets].inject(:+)
  end

  def optional_pts
    pts = [pts_cable_wires, pts_guns, pts_pilot_on_board, pts_wing_structure,
           pts_biplane, pts_four_stroke_engine].inject(:+)
    pts > 100 ? 100 : pts
  end

  #main points
  def pts_seconds;        (seconds / 3.0).ceil;      end
  def pts_cuts;           cuts*100;                  end
  def pts_uncut;          uncut? ? 50 : 0;           end
  def pts_non_engagement; non_engagement? ? -50 : 0; end
  def pts_crossed_line;   crossed_line? ? -200 : 0;  end
  def pts_ground_start;   ground_start? ? 50 : 0;    end
  def pts_landed;         landed? ? 50 : 0;          end

  #optional points
  def pts_ground_targets;     ground_targets * 50;          end
  def pts_cable_wires;        cable_wires? ? 10 : 0;        end
  def pts_guns;               guns? ? 10 : 0;               end
  def pts_pilot_on_board;     pilot_on_board? ? 10 : 0;     end
  def pts_wing_structure;     wing_structure? ? 10 : 0;     end
  def pts_biplane;            biplane? ? 50 : 0;            end
  def pts_four_stroke_engine; four_stroke_engine? ? 30 : 0; end
end

class Admin::TournamentsController < Admin::BaseController
  def index
    @pilots = Pilot.all
  end
end

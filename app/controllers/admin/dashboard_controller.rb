class Admin::DashboardController < Admin::BaseController
  def index
    @tournaments = Tournament.all
  end
end

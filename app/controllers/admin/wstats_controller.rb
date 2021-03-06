class Admin::WstatsController < Admin::BaseController
  before_filter :wstat, :only => [:edit, :show, :update, :destroy]
  def index
    @wstats = Wstat.all
  end

  def show
  end

  def new
    @tindex     = params[:tindex].to_i + 1
    @wstat      = Wstat.new
    @pilot      = Pilot.find(params[:pilot_id])
    @tour       = Tour.find(params[:tour_id])
    @tournament = Tournament.find(params[:tournament_id])
  end

  def create
    @wstat = Wstat.create(params[:wstat])
    tournament = params[:wstat][:tournament_id]
    if @wstat.errors.any?
      render :action => :new
    else
      flash[:success] = "Wstat #{@wstat.id} was created"
      redirect_to admin_tournament_path(tournament)
    end
  end

  def edit
    @tindex     = params[:tindex].to_i + 1
    @pilot      = Pilot.find(params[:pilot_id])
    @tour       = Tour.find(params[:tour_id])
    @tournament = Tournament.find(params[:tournament_id])
  end

  def update
    tournament = params[:wstat][:tournament_id]
    @wstat.update_attributes(params[:wstat])
    if @wstat.errors.any?
      render :action => :edit, :wstat => @wstat
    else
      flash[:success] = "Wstat #{@wstat.id} was updated"
      redirect_to admin_tournament_path(tournament)
    end
  end

  def destroy
    @wstat.destroy
    flash[:success] = "Wstat #{@wstat.id} was deleted"
    redirect_to :back
  end

private
  def wstat
    @wstat = Wstat.find(params[:id])
  end
end

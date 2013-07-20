class Admin::WwstatsController < Admin::BaseController
  before_filter :wwstat, :only => [:edit, :show, :update, :destroy]
  def index
    @wstats = Wwstat.all
  end

  def show
  end

  def new
    @tindex     = params[:tindex].to_i + 1
    @wwstat     = Wwstat.new
    @pilot      = Pilot.find(params[:pilot_id])
    @tour       = Tour.find(params[:tour_id])
    @tournament = Tournament.find(params[:tournament_id])
  end

  def create
    @wwstat = Wwstat.create(params[:wwstat])
    tournament = params[:wwstat][:tournament_id]
    if @wwstat.errors.any?
      render :action => :new
    else
      flash[:success] = "Wwstat #{@wwstat.id} was created"
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
    tournament = params[:wwstat][:tournament_id]
    @wwstat.update_attributes(params[:wwstat])
    if @wwstat.errors.any?
      render :action => :edit, :wwstat => @wwstat
    else
      flash[:success] = "Wwstat #{@wwstat.id} was updated"
      redirect_to admin_tournament_path(tournament)
    end
  end

  def destroy
    @wwstat.destroy
    flash[:success] = "Wwstat #{@wwstat.id} was deleted"
    redirect_to :back
  end

private
  def wwstat
    @wwstat = Wwstat.find(params[:id])
  end
end

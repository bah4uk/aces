class Admin::TournamentsController < Admin::BaseController
  before_filter :tournament, :only => [:edit, :show, :update, :destroy]

  def index
    @tournaments = Tournament.all
  end

  def show
    @tournament = Tournament.includes(:pilots => :country).find(params[:id])
    @pilots = @tournament.pilots
    @tours = @tournament.tours.includes(:pilots => :country)

    respond_to do |format|
      format.html
      format.xls
    end
  end

  def new
    @tournament = Tournament.new
  end

  def create
    @tournament = Tournament.create(params[:tournament])
    if @tournament.errors.any?
      render :action => :new
    else
      flash[:success] = "Tournament #{@tournament.name} was created"
      redirect_to :action => :index
    end
  end

  def pick_pilots
    @tournament = Tournament.find(params[:tournament_id])
    @pilots = Pilot.all
  end

  def add_pilot
    pilot = Pilot.find(params[:pilot_id])
    tournament = Tournament.find(params[:tournament_id])
    tournament.pilots.push(pilot)
    redirect_to :action => :show
  end

  def shuffle
    tournament = Tournament.find(params[:tournament_id])
    case tournament.category.name
      when "WWI"
        Tool::Shuffle2.shuffle(tournament)
      when "WWII"
        Tool::Shuffle.shuffle(tournament)
      else
        nil
      end
    redirect_to :action => :show
  end

  def remove_pilot
    pilot = Pilot.find(params[:pilot_id])
    tournament = Tournament.find(params[:tournament_id])
    tournament.pilots.delete(pilot)
    redirect_to :action => :show
  end

  def edit
  end

  def update
    @tournament.update_attributes(params[:tournament])
    if @tournament.errors.any?
      render :action => :edit, :tournament => @tournament
    else
      flash[:success] = "Tournament #{@tournament.name} was updated"
      redirect_to :action => :index
    end
  end

  def destroy
    @tournament.destroy
    flash[:success] = "Tournament #{@tournament.name} was deleted"
    redirect_to :action => :index
  end

private
  def tournament
    @tournament = Tournament.find(params[:id])
  end
end

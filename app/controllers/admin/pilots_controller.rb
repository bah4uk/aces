class Admin::PilotsController < Admin::BaseController
  before_filter :pilot, :only => [:edit, :show, :update, :destroy]
  def index
    @pilots = Pilot.all
  end

  def show
  end

  def new
    @pilot = Pilot.new
    @tournaments = Tournament.all
  end

  def create
    @pilot = Pilot.create(params[:pilot])
    params[:tournament].each do |tournament|
      Tournament.find(tournament.to_i).pilots.push(@pilot)
    end
    if @pilot.errors.any?
      render :action => :new
    else
      flash[:success] = "Pilot #{@pilot.name} was created"
      redirect_to :action => :index
    end
  end

  def edit
  end

  def update
    @pilot.update_attributes(params[:pilot])
    if @pilot.errors.any?
      render :action => :edit, :pilot => @pilot
    else
      flash[:success] = "Pilot #{@pilot.name} was updated"
      redirect_to :action => :index
    end
  end

  def destroy
    @pilot.destroy
    flash[:success] = "Pilot #{@pilot.name} was deleted"
    redirect_to :action => :index
  end

private
  def pilot
    @pilot = Pilot.find(params[:id])
  end
end

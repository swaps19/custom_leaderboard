class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]
  before_action :set_events, only: [:edit, :new]

  def show
    month = params[:month] || Time.current.month
    @events = @team.for_month(month)
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      flash[:success] = "Team #{@team.name} added successfully!"
    else
      flash[:error] = @team.errors.full_messages.join('<br/>')
    end
    redirect_to :root #action: :show, id: @team.id
  end

  def edit
  end

  def update
    @team.assign_attributes(team_params)
    if @team.save
      flash[:success] = "Team #{@team.name} updated successfully!"
    else
      flash[:error] = @team.errors.full_messages.join('<br/>')
    end
    redirect_to action: :show, id: @team.id
  end

  def index
    @teams = Team.all
  end

  def destroy
    @team.destroy

    if @team.destroyed?
      flash[:success] = "Team #{@team.name} deleted successfully!"
    else
      flash[:error] = "Failed to delete the team #{@team.name}!"
    end
    redirect_to action: :index
  end

  private

  def set_team
    @team = Team.find_by(id: params[:id])
  end

  def set_events
    @events = Event.all
  end

  def team_params
    params.require(:team)
          .permit(:name)
  end
end

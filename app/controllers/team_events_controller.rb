class TeamEventsController < ApplicationController
  before_action :set_data
  before_action :set_team_event, only: [:edit, :update, :destroy]

  def new
    @team_event = TeamEvent.new(team: @team, event: @event)
    raise ActionController::RoutingError.new('Not Found') unless @from_event || @from_team
  end

  def create
    team_event = TeamEvent.new(team_event_params)
    if team_event.save
      flash[:success] = "Team Event added successfully!"
      redirect_page
    else
      flash[:error] = team_event.errors.full_messages.join('<br/>')
      redirect_to(action: :new, team_id: @team.try(:id), event_id: @event.try(:id), from_event: @from_event, from_team: @from_team)
    end
  end

  def update
    @team_event.assign_attributes(team_event_params)
    if @team_event.save
      flash[:success] = "Team Event updated successfully!"
      redirect_page
    else
      flash[:error] = @team_event.errors.full_messages.join('<br/>')
      redirect_to(action: :edit, team_id: @team.try(:id), event_id: @event.try(:id), from_event: @from_event, from_team: @from_team)
    end
  end

  def edit
  end

  def destroy
    @team_event.destroy

    if @team_event.destroyed?
      flash[:success] = "Team Event deleted successfully!"
    else
      flash[:error] = "Failed to delete the Team Event!"
    end
    redirect_page
  end

  private

  def set_data
    @team  = Team.find_by(id: params[:team_id] || params[:team_event].try(:[], :team_id))
    @event = Event.find_by(id: params[:event_id] || params[:team_event].try(:[], :event_id))
    @from_team = params[:from_team] && params[:from_team] == true.to_s
    @from_event = params[:from_event] && params[:from_event] == true.to_s
    @teams = Team.all
    @events = Event.all
    @assigned_teams = Team.where(id: TeamEvent.select(:team_id).where(event_id: @event.try(:id)))
    @assigned_events = Event.where(id: TeamEvent.select(:event_id).where(team_id: @team.try(:id)))
  end

  def set_team_event
    @team_event = TeamEvent.find_by(id: params[:id])
    @team = @team_event.team
    @event = @team_event.event
  end

  def team_event_params
    params.require(:team_event).permit(:points, :event_id, :team_id)
  end

  def redirect_page
    @from_team ? redirect_to(controller: :teams, action: :show, id: @team.id) : redirect_to(controller: :events, action: :show, id: @event.id)
  end
end

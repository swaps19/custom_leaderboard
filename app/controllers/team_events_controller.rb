class TeamEventsController < ApplicationController
  before_action :set_data

  def new
    @teams = Team.all
    @events = Event.all
    @team_event = TeamEvent.new(team: @team, event: @event)
  end

  def create
    team_event = TeamEvent.new(team_event_params)
    if team_event.save
      flash[:success] = "#{@from_team ? 'Team' : 'Event'} #{team_event.name} added successfully!"
    else
      flash[:error] = team_event.errors.full_messages.join('<br/>')
    end

    @from_team ? redirect_to(:team_path, id: @team.id) : redirect_to(:event_path, id: @event.id)
  end

  private

  def set_data
    @team  = Team.find_by(id: params[:team_id]) if params[:team_id].present?
    @event = Event.find_by(id: params[:event_id]) if params[:event_id].present?
    @from_team = @team.present?
    @from_event = @event.present?
  end

  def team_event_params
    params.require(:team_event).permit(:points, :event_id, :team_id)
  end
end

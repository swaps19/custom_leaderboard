module TeamEventsHelper
  def options_for_events
    events_data = @events.collect do |e|
      [e.name, e.id, disabled: @assigned_events.ids.include?(e.id)]
    end
    options_for_select(events_data, [@event.try(:name), @event.try(:id)])
  end

  def options_for_teams
    teams_data = @teams.collect do |t|
      [t.name, t.id, disabled: @assigned_teams.ids.include?(t.id)]
    end
    options_for_select(teams_data, [@team.try(:name), @team.try(:id)])
  end
end


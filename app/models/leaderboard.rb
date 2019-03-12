class Leaderboard
  class << self
    def current
      {
        team_status: team_status,
        event_details: event_details
      }
    end

    def team_status
      Team.joins('LEFT JOIN team_events ON teams.id = team_events.team_id')
          .select('teams.name AS team_name, COALESCE(sum(team_events.points), 0) AS total_points, teams.id')
          .group('team_name, teams.id')
          .order('total_points DESC')
    end

    def event_details
      Event.order(conducted_at: :desc)
           .select(:id, :name, :conducted_at)
    end
  end
end

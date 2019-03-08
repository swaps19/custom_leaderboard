class Leaderboard
  class << self
    def current
      {
        team_status: team_status,
        event_details: event_details
      }
    end

    def team_status
      Team.joins(:team_events)
          .select('teams.name AS team_name, sum(team_events.points) AS total_points, teams.id')
          .group('team_name, teams.id')
          .order('total_points DESC')
    end

    def event_details
      Event.order(conducted_at: :desc)
           .select(:id, :name, :conducted_at)
    end
  end
end

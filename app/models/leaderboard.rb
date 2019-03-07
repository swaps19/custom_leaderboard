class Leaderboard
  class << self
    def current
      Team.joins(:team_events, :events)
          .select("teams.name AS team_name, team_events.points, date_trunc('month', events.conducted_at) AS event_month")
          .select("events.name AS event_name, date_trunc('day', events.conducted_at) AS event_date")
          .order('events.conducted_at DESC')
    end
  end
end

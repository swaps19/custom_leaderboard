class Event < ApplicationRecord
  has_many :team_events, dependent: :destroy
  has_many :teams, through: :team_events

  validates_presence_of :name, :conducted_at

  def for_month(month = Time.current.month)
    teams = self.class.joins(teams: :team_events)
      .select("DISTINCT team_events.points, teams.name AS team_name, teams.id AS team_id, team_events.id AS team_event_id")
      .where("events.id = ?", id)
      .order('team_events.points DESC')

      teams = teams.where("date_part('month', events.conducted_at) = ? ", month) if month.present?
      teams
  end
end

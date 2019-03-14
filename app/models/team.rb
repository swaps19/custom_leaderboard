class Team < ApplicationRecord
  has_many :team_events, dependent: :destroy
  has_many :events, through: :team_events

  validates_presence_of :name

  def for_month(month = Time.current.month)
    events = self.class.joins(:team_events, :events)
      .select("team_events.points, date_part('month', events.conducted_at) AS event_month, events.id AS event_id")
      .select("events.name AS event_name, date_trunc('day', events.conducted_at) AS event_date")
      .where("teams.id = ?", id)
      .order('events.conducted_at DESC')

      events = events.where("date_part('month', events.conducted_at) = ? ", month) if month.present?
      events
  end
end

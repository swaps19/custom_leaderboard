class Team < ApplicationRecord
  has_many :team_events
  has_many :events, through: :team_events

  accepts_nested_attributes_for :team_events
  validates_presence_of :name

  def for_month(month = Time.current.month)
    self.class.joins(:team_events, :events)
      .select("team_events.points, date_part('month', events.conducted_at) AS event_month")
      .select("events.name AS event_name, date_trunc('day', events.conducted_at) AS event_date")
      .where("date_part('month', events.conducted_at) = ? ", month)
      .where("teams.id = ?", id)
      .order('events.conducted_at DESC')
  end
end

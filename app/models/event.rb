class Event < ApplicationRecord
  has_many :team_events
  has_many :teams, through: :team_events
end

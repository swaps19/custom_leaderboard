class Team < ApplicationRecord
  has_many :team_events
  has_many :events, through: :team_events
end

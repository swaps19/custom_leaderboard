class TeamEvent < ApplicationRecord
  belongs_to :team
  belongs_to :event

  validates_presence_of :points
  validates :points, numericality: true
end

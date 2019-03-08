class TeamsController < ApplicationController
  before_action :set_team, only: [:show]

  def show
    month = params[:month] || Time.current.month
    @events = @team.for_month(month)
  end

  private

  def set_team
    @team = Team.find_by(id: params[:id])
  end
end

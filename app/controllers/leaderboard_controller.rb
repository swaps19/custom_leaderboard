class LeaderboardController < ApplicationController
  def index
    # month = params[:month] || Time.current.month
    @leaderboard = Leaderboard.current
  end
end

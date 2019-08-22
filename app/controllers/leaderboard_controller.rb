class LeaderboardController < ApplicationController
  def index
    @leaderboard = Leaderboard.current
  end
end

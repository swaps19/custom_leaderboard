class EventsController < ApplicationController
  before_action :set_event, only: [:show]

  def show
    month = params[:month] || Time.current.month
    @events = @event.for_month(month)
  end

  private

  def set_event
    @event = Event.find_by(id: params[:id])
  end
end

class EventsController < ApplicationController
  before_action :set_event, only: [:show]

  def show
    # month = params[:month] || Time.current.month
    @teams = @event.for_month(nil)
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:success] = "Event #{@event.name} added successfully!"
      redirect_to action: :show, id: @event.id
    else
      flash[:error] = @event.errors.full_messages.join('<br/>')
      redirect_to action: :new
    end
  end

  def edit
  end

  def update
    @event.assign_attributes(event_params)
    if @event.save
      flash[:success] = "Event #{@event.name} updated successfully!"
    else
      flash[:error] = @event.errors.full_messages.join('<br/>')
    end
    redirect_to action: :show, id: @event.id
  end

  def index
    @events = Event.all
  end

  def destroy
    @event.destroy

    if @event.destroyed?
      flash[:success] = "Event #{@event.name} deleted successfully!"
    else
      flash[:error] = "Failed to delete the event #{@event.name}!"
    end
    redirect_to action: :index
  end

  private

  def set_event
    @event = Event.find_by(id: params[:id])
  end

  def event_params
    params.require(:event)
          .permit(:name, :conducted_at)
  end
end

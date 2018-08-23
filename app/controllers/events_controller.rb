class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create #testing
    @event = Event.create(event_params)
    if @event.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  def update
    @event.update(event_params)
    if @event.valid?
      flash[:notice] = 'Successfully updated your event!'
      redirect_to event_path(@event)
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path
  end

  private

    def set_event
      @event = Event.find_by_id(params[:id])
    end

    def event_params
      params.require(:event).permit(:title, :capacity, :time, :description, :venue_id, :host_id, user_id: [])
    end
end

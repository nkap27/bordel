class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.create(create_params)
    @event.host_id = session[:user_id]
    if @event.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  def update
    @event.update(update_params)
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

    def create_params
      params.require(:event).permit(:title, :capacity, :time, :description, :venue_id)
    end

    def update_params
      params.require(:event).permit(:title, :capacity, :time, :description, :venue_id, user_id: [])
    end
end

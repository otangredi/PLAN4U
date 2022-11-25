class EventsController < ApplicationController
  before_action :set_event, only: :show

  def index
    @events = current_user.events.first
    @wedding = Event.where("name ILIKE ?", "%wedding%").first
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user

    if @event.save
      redirect_to events_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:partner_name, :venue, :date, :name)
  end
end

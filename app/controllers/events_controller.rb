class EventsController < ApplicationController
  before_action :set_event, only: :show

  def index
    @events = Event.all
    @wedding = Event.where("name ILIKE ?", "%wedding%").first
    count_status
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

  def count_status
    @yes = 0
    @no = 0
    @awaiting = 0
    @wedding.guests.each do |guest|
      case guest.status
      when "Attending"
        @yes += 1
      when "Not_Attending"
        @no += 1
      when "Awaiting_Response"
        @awaiting += 1
      end
    end
  end

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:partner_name, :venue, :date, :name)
  end
end

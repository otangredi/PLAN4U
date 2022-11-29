class EventsController < ApplicationController
  before_action :set_event, only: :show
  skip_before_action :verify_authenticity_token, only: [:change_value] # we need to haddle authentication from frontend

  def index
    @event = current_user.events.first
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

  def change_value
    case checkbox_params['name']
    when 'guest_list'
      current_user.update(guest_list: !current_user.guest_list)
    when 'design_cards'
      current_user.update(design_cards: !current_user.design_cards)
    when 'send_cards'
      current_user.update(send_cards: !current_user.send_cards)
    end

    render json: { message: "#{checkbox_params['name']} updated" }, status: 200
  end

  private

  def count_status
    @yes = 0
    @no = 0
    @awaiting = 0
    @event.guests.each do |guest|
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

  def checkbox_params
    params.require(:event).permit(:name)
  end
end

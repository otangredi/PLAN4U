class GuestsController < ApplicationController
  require 'csv'

  before_action :set_guest, only: %i[show edit update destroy]

  def index
    @guests = Guest.all
    @event = Event.find(params[:event_id])
  end

  def new
    @guest = Guest.new
    @event = Event.find(params[:event_id])
  end

  def create
    @guest = Guest.new(guest_params)
    @event = Event.find(params[:event_id])
    @guest.event = @event

    if @guest.save
      redirect_to event_guests_path(@event), notice: "Guest was successfully added"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @event = @guest.event
  end

  def update
    @guest = Guest.find(params[:id])
    @event = Event.find(params[:event_id])
    @guest.event = @event
    @guest.update(guest_params)
    respond_to do |format|
      format.html { redirect_to event_guests_path(@event) }
      format.text { render partial: 'guest', formats: :html, locals: { guest: @guest } }
    end
  end

  def destroy
    @guest.destroy
    redirect_to event_guests_path(@guest.event)
  end

  # this file location will need to change depending on how file is received
  # incomplete, need frontend first
  def import_guests_from_file
    guest_list = CSV.read(File.join(Dir.pwd, '/app/assets/demo_guestlist/guestlist.csv'))

    guest_list[1..].each do |guest|
      Guest.create!(
        first_name: guest[1],
        last_name: guest[2],
        relationship: guest[3],
        email: guest[4],
        event: current_user.events.first
      )
    end
    redirect_to event_guests_path(Event.first)
  end

  private

  def set_guest
    @guest = Guest.find(params[:id])
  end

  def guest_params
    params.require(:guest).permit(:first_name, :last_name, :relationship, :status, :email)
  end
end

# Event.create!(
#   date: Date.today,
#   venue: "Le Mont Blanc",
#   partner_name: "Anthony",
#   user_id: 1,
#   name: "Wedding"
# )

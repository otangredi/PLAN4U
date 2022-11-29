class GuestsController < ApplicationController
  require 'csv'

  before_action :set_guest, only: %i[show edit update destroy send_one_evite send_all_evite]

  def index
    @event = Event.find(params[:event_id])
    @guests = @event.guests.all if @event.guests.present?

    if params[:query].present?
      @guests = @event.guests.search_by_name(params[:query])
    else
      @guests = @event.guests.all
    end
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

  def import_guests_from_file
    puts file_params
    guest_list = CSV.read(file_params)

    guest_list[1..].each do |guest|
      Guest.create!(
        name: guest[1],
        relationship: guest[2],
        email: guest[3],
        event: current_user.events.first
      )
    end
    redirect_to event_guests_path(Event.first)
  end

  def send_all_evite
    @event = current_user.events.first
    @template_id = @event.e_vite.template_id
    @guests = Guest.all
    @guests.each do |guest|
      EviteMailer.with(user: current_user, event: @event, guest: guest).welcome_email.deliver_now
      set_status(guest)
    end

    redirect_back_or_to '/', allow_other_host: false, notice: "All e-vite was successfully send"
  end

  def send_one_evite
    @event = current_user.events.first
    EviteMailer.with(user: current_user, event: @event, guest: @guest).welcome_email.deliver_now
    redirect_back_or_to '/', allow_other_host: false, notice: "This e-vite was successfully send"
  end

  private

  def set_guest
    @guest = Guest.find(params[:id])
  end

  def file_params
    params.require(:file)
  end

  def guest_params
    params.require(:guest).permit(:name, :relationship, :status, :email)
  end

  def set_status(guest)
    guest.status = 1
    guest.save!
  end
end

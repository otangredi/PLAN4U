class GuestsController < ApplicationController
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

  private

  def set_guest
    @guest = Guest.find(params[:id])
  end

  def guest_params
    params.require(:guest).permit(:first_name, :last_name, :relationship, :status, :email)
  end
end

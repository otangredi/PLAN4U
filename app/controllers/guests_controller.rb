class GuestsController < ApplicationController
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
    @guest.event = Event.find(params[:event_id])

    if @guest.save
      redirect_to @guest, notice: "Guest was successfully added."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_guest
    @guest = Guest.find(params[:id])
  end

  def guest_params
    params.require(:guest).permit(:first_name, :last_name, :relationship, :status, :email)
  end
end

class GuestChoicesController < ApplicationController
  skip_before_action :authenticate_user!

  def rsvp_home
    @event = Event.find(params[:event_id])
  end

  def find_rsvp
    @user = current_user
    @event = @user.events.first
    if params[:query].present?
      @guests = Guest.where("name ILIKE ? AND event_id = ?", "%#{params[:query]}%", "#{@event.id}")
    end
  end

  def index
    @guest = Guest.find(params[:guest_id])
  end

  def new
    @user = current_user
    @event = @user.events.first
    @guest = Guest.find(params[:guest_id])
    @guest_choice = GuestChoice.new
  end

  def create(guest)
    #@guest = Guest.find(params[:guest_id])
    @guest_choice = GuestChoice.new
    @guest_choice.guest = guest
    if @guest_choice.save!
      redirect_to edit_guest_guest_choice_path(guest, @guest_choice)
    end
  end

  def attendance
    @guest = Guest.find(params[:id])
    @guest.status = params[:status].to_i
    @guest.save!
    case @guest.status
    when "Attending"
      create(@guest)
    when "Not_Attending"
      redirect_to guest_guest_choices_path(@guest)
    else
      "Error: choice has an invalid value"
    end
  end

  def edit
    @guest = Guest.find(params[:guest_id])
    @guest_choice = GuestChoice.find(params[:id])
    @guests = @guest_choice.guest.event.guests.all
  end

  def update
    @guest = Guest.find(params[:guest_id])
    @guest_choice = GuestChoice.find(params[:id])
    @guest_choice.choices = [Guest.find(params[:guest_id]).name, Guest.find(params[:guest_choice][:choices].first).name, Guest.find(params[:guest_choice][:choices].second).name]
    if @guest_choice.update(guest_choice_params)
      redirect_to guest_guest_choices_path(@guest)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def guest_choice_params
    raise
    params.require(:guest_choice).permit(:choices)
  end
end

class GuestChoicesController < ApplicationController
  def index
    if params[:query].present?
      @guest = Guest.where("name ILIKE ?", "%#{params[:query]}%")
      @guest.first.guest_choice = GuestChoice.new unless @guest.first.guest_choice.present?
      redirect_to guest_choice_path(@guest.first.guest_choice)
    end
  end

  def show
    @guest = GuestChoice.find(params[:id]).guest
  end

  def attendance
    @guest = Guest.find(params[:id])
    @guest.status = params[:status].to_i
    @guest.save!
  end

  def create
  end
end

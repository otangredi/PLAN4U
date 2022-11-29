class EVitesController < ApplicationController
  before_action :set_e_vite, only: %i[show edit update destroy]
  def index
    @e_vites = EVite.all
    @event = Event.find(params[:event_id])
  end

  def new
    @e_vite = EVite.new
    @event = Event.find(params[:event_id])
  end

  def create
    if EVite.all.empty?
      @e_vite = EVite.new(e_vite_params)
      @e_vite.event_id = params[:event_id]
      if @e_vite.save
        redirect_to events_path, notice: "E-vite was successfully create."
      else
        render :new, status: :unprocessable_entity
      end
    else
      update
    end
  end

  def update
    @event = Event.find(params[:event_id])
    @e_vite = @event.e_vite
    if @e_vite.update(e_vite_params)
      redirect_to events_path, notice: "E-vite was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_e_vite
    @e_vite = EVite.find(params[:id])
  end

  def e_vite_params
    params.require(:e_vite).permit(:template_id)
  end
end

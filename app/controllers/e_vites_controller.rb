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
    @e_vite = EVite.new(e_vite_params)
    @e_vite.event_id = params[:event_id]
    if @e_vite.save
      redirect_to events_path
    else
      render :new, status: :unprocessable_entity
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

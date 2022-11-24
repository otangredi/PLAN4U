class EVitesController < ApplicationController
  def index
    @e_vites = EVite.all
    @event = Event.find(params[:event_id])
  end
end

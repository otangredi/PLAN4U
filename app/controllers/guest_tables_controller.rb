class GuestTablesController < ApplicationController
  def index
    @tables = GuestTable.all
    @event = Event.find(params[:event_id])
  end

  def new
    @table = GuestTable.new
    @event = Event.find(params[:event_id])
  end

  def create
    quantity = params[:quantity][:quantity].to_i
    quantity.times do
      new
      @table = GuestTable.new
      @table.event = Event.find(params[:event_id])
      if @table.save

      else
        render :new, status: :unprocessable_entity
      end
    end
    redirect_back_or_to '/', allow_other_host: false
  end

  def destroy
    @guest_table.destroy
    redirect_to redirect_back_or_to '/', status: :see_other
  end

  private

  def set_table
    @table = table.find(params[:id])
  end

  def table_params
    params.require(:guest_table).permit
  end
end

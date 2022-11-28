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
    @event = Event.find(params[:event_id])
    @table = GuestTable.new(table_params)
    @table.event = @event
    if @table.save!
      redirect_to event_guest_table_path(@event, @table)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @event = Event.find(params[:event_id])
    @table = GuestTable.find(params[:id])
    @guest_choices = @event.guest_choices
    guests = Guest.all.map { |g| g.name }
    connection_1 = [GuestChoice.all.map do |guest_choice|
                    {people: guest_choice.choices, weight: 2}
                    end ]
    connection_2 = [GuestChoice.all.map do |guest_choice|
                    {people: guests - guest_choice.choices + [guest_choice.choices.first], weight: 1}
                    end ]
    connections = connection_1.flatten + connection_2.flatten
    tables = [5, @table.num_of_seats]
    @seating = ORTools::Seating.new(connections: connections.flatten, tables: tables)
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
    params.require(:guest_table).permit(:num_of_seats)
  end
end

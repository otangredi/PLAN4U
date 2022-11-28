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
    guests = @event.guests.all.map { |g| g.name }
    connection_1 = [@event.guests.all.map do |guest|
                    {people: guest.guest_choice.choices - [guest.guest_choice.choices.last], weight: 6}
                    end ]
    connection_2 = [@event.guests.all.map do |guest|
                    {people: guests - guest.guest_choice.choices + [guest.guest_choice.choices.last] + [guest.guest_choice.choices.first], weight: 1}
                    end ]
    connection_3 = [{people: @event.guests.where(relationship: "Family_B").map { |g| g.name }, weight: 5}]
    connection_4 = [{people: @event.guests.where(relationship: "Family_G").map { |g| g.name }, weight: 5}]
    connection_5 = [{people: @event.guests.where(relationship: "Friend_B").map { |g| g.name }, weight: 5}]
    connection_6 = [{people: @event.guests.where(relationship: "Friend_G").map { |g| g.name }, weight: 5}]
    connection_7 = [{people: guests, weight: 1}]

    connections = connection_1.flatten + connection_2.flatten + connection_3 + connection_4 + connection_5 + connection_6 + connection_7
    tables = [3, 20]
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

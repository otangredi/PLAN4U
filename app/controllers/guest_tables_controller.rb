class GuestTablesController < ApplicationController
  def index
    @tables = GuestTable.all
    @event = Event.find(params[:event_id])
  end

  def new
    @event = Event.find(params[:event_id])
    @table = GuestTable.new
  end

  def create
    @event = Event.find(params[:event_id])
    @table = GuestTable.new(table_params)

    #Family_B Table Making
    guests = @event.guests.where(relationship: "My Family").map { |g| g.name }
    connection_1 = [@event.guests.where(relationship: "My Family").map do |guest|
                    {people: guest.guest_choice.choices, weight: 2}
                    end ]
    connection_2 = [@event.guests.where(relationship: "My Family").map do |guest|
                    {people: guests - guest.guest_choice.choices + [guest.name], weight: 1}
                    end ]
    connections_3 = connection_1.flatten + connection_2.flatten
    tables = [5, 5]
    seating_1 = ORTools::Seating.new(connections: connections_3.flatten, tables: tables)
    @table.tables += seating_1.assigned_tables

    guests = @event.guests.where(relationship: "Partner's Family").map { |g| g.name }
    connection_4 = [@event.guests.where(relationship: "Partner's Family").map do |guest|
                    {people: guest.guest_choice.choices, weight: 2}
                    end ]
    connection_5 = [@event.guests.where(relationship: "Partner's Family").map do |guest|
                    {people: guests - guest.guest_choice.choices + [guest.name], weight: 1}
                    end ]
    connections_6 = connection_4.flatten + connection_5.flatten
    tables = [5, 5]
    seating_2 = ORTools::Seating.new(connections: connections_6.flatten, tables: tables)
    @table.tables += seating_2.assigned_tables

    guests = @event.guests.where(relationship: "My Friend").map { |g| g.name }
    connection_7 = [@event.guests.where(relationship: "My Friend").map do |guest|
                    {people: guest.guest_choice.choices, weight: 2}
                    end ]
    connection_8 = [@event.guests.where(relationship: "My Friend").map do |guest|
                    {people: guests - guest.guest_choice.choices + [guest.name], weight: 1}
                    end ]
    connections_9 = connection_7.flatten + connection_8.flatten
    tables = [5, 5]
    seating_3 = ORTools::Seating.new(connections: connections_9.flatten, tables: tables)
    @table.tables += seating_3.assigned_tables

    guests = @event.guests.where(relationship: "Partner's Friend").map { |g| g.name }
    connection_10 = [@event.guests.where(relationship: "Partner's Friend").map do |guest|
                    {people: guest.guest_choice.choices, weight: 2}
                    end ]
    connection_11 = [@event.guests.where(relationship: "Partner's Friend").map do |guest|
                    {people: guests - guest.guest_choice.choices + [guest.name], weight: 1}
                    end ]
    connections_12 = connection_10.flatten + connection_11.flatten
    tables = [5, 5]
    seating_4 = ORTools::Seating.new(connections: connections_12.flatten, tables: tables)
    @table.tables += seating_4.assigned_tables

    @table.event = @event
    if @table.save!
      redirect_to event_guest_table_path(@event, @table)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @table = GuestTable.find(params[:id])
  end

  def destroy
    @guest_table.destroy
    redirect_to redirect_back_or_to '/', status: :see_other
  end

  private

  def set_table
    @table = GuestTable.find(params[:id])
  end

  def table_params
    params.require(:guest_table).permit(:num_of_seats)
  end
end

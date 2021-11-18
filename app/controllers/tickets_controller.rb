class TicketsController < ApplicationController
  before_action :set_showtime, :set_tickets

  ROWS = %w[A B C D E].freeze

  def new
    @ticket = Ticket.new
  end

  def create
    @row = params[:row]
    @user = params[:user]
    seats = params[:seats].split(';')
    ActiveRecord::Base.transaction do
      seats.each do |seat|
        ticket = Ticket.new(showtime_id: @showtime.id, user: @user, row: @row, seat: seat)
        @errors = ticket.errors unless ticket.save
      end
      raise ActiveRecord::Rollback if @errors.present?
    end
    respond_to do |format|
      if @errors.present?
        format.html { render :new }
        format.json { render json: @errors, status: :unprocessable_entity }
      else
        format.html { redirect_to @ticket, notice: 'ticket correctly saved.' }
        format.json { render :index, status: :created, location: @ticket }
      end
    end
  end

  def show
    @ticket = Ticket.find(params[:id])
  end

  private

  def set_showtime
    @showtime = Showtime.find(params[:showtime_id])
  end

  def set_tickets
    @tickets = @showtime.tickets
  end

  def set_rows
    @rows = {}
    ROWS.each do |row|
      puts 'Terminar'
    end
  end

  def set_available_seats
    seats = []
    (1..12).each do |seat|
      seats.push(seat)
    end
    seats
  end
end

class TicketsController < ApplicationController
  before_action :set_showtime, :set_tickets, :set_bought_ticket

  ROWS = %w[A B C D E].freeze

  def new
    @ticket = Ticket.new
  end

  def create
    @seats_selected = []
    params['ticket'].each_key do |key|
      @seats_selected.push(key.split('-')[-1]) if key.include? 'seat'
    end
    @row = params['ticket'][:row]
    @user = params['ticket'][:user]
    @seats_selected = [0] if @seats_selected.empty?
    respond_to do |format|
      ActiveRecord::Base.transaction do
        @seats_selected.each do |seat|
          ticket = Ticket.new(showtime_id: @showtime.id, user: @user, row: @row, seat: seat)
          @errors = ticket.errors unless ticket.save
        rescue ActiveRecord::RecordNotUnique
          format.html { redirect_to '/', notice: "The ticket #{@row}-#{seat} was already bought!" }
          break
        end
        raise ActiveRecord::Rollback if @errors.present?
      end
      if @errors.present?
        format.html { redirect_to '/', notice: 'Incorrectly filled fields. Did you enter a user and a seat?' }
        format.json { render json: @errors, status: :unprocessable_entity }
      else
        format.html { redirect_to '/', notice: 'Ticket bought correctly!' }
        format.json { render :index, status: :created, location: @ticket }
      end
    end
  end

  def show
    @ticket = Ticket.find(params[:id])
  end

  def index
    @tickets = @showtime.tickets
  end

  private
  def set_showtime
    @showtime = Showtime.find(params[:showtime_id])
  end

  def set_tickets
    @show_tickets = @showtime.tickets
  end

  def set_bought_ticket
    @seats = {}
    ROWS.each do |row|
      tickets_used = @show_tickets.where(row: row).pluck('seat')
      @seats[row] = tickets_used
    end
    @seats
  end
end
class TicketsController < ApplicationController
  before_action :set_showtime
  def index
    @tickets = @showtime.tickets
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @row = params[:row]
    @user = params[:user]
    columns = params[:columns].split(';')
    ActiveRecord::Base.transaction do
      columns.each do |column|
        ticket = Ticket.new(showtime_id: @showtime.id, user: @user, row: @row, column: column)
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
end

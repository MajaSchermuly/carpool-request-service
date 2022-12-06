# frozen_string_literal: true

require 'date'

class AssignmentsController < ApplicationController
  before_action :set_assignment, only: %i[show edit update destroy]
  before_action :set_assignment_id, only: %i[dropped_off]

  # GET /assignments or /assignments.json
  def index
    @assignments = Assignment.all.order('assignment_id ASC')
  end

  # GET /assignments/riding
  def riding
    @assignments = Assignment.where(request_id: Request.where(request_status: 'Assigned Driver')).order('created_at ASC')
  end

  # GET /assignments/done
  def done
    @ndr = Ndr.find_by(is_active: true)
    @requests = Request.where('created_at > ? and created_at < ?', @ndr.start_time, @ndr.end_time).where(request_status: %w[Done Cancelled Missed]).order('updated_at DESC') if @ndr
  end

  # GET/assignments/queue
  def queue
    @requests_waiting = Request.search(params[:search_name], params[:search_phone_number]).where(request_status: 'Unassigned').order('created_at ASC')
    @requests_riding = Request.search(params[:search_name], params[:search_phone_number]).where(request_status: 'Assigned Driver').order('created_at ASC')
    @requests_done = Request.search(params[:search_name], params[:search_phone_number]).where(request_status: %w[Done Cancelled Missed]).order('updated_at DESC')

    # Check spot in line
    # logger.debug "\nRequests Waiting: #{@requests_waiting.inspect}"
    @spot_in_line = @requests_waiting.first.queue_pos unless @requests_waiting.empty?

    # Get car information for request
    @current_riding_assignment = Assignment.find_by(request_id: @requests_riding.first)
    @current_car = (Car.find_by(car_id: @current_riding_assignment.car_id) if @current_riding_assignment)
  end

  # GET /assignments/1 or /assignments/1.json
  def show
    @request = Request.find_by(request_id: @assignment.request_id)
  end

  # GET /assignments/new
  def new
    @assignment = Assignment.new

    # added for select field
    @valid_requests = Request.where(request_status: 'Unassigned')
  end

  # GET /assignments/assign
  def assign
    @assignment = Assignment.new
    @request = Request.find(params[:request_id])

    # for the select field of cars
    @cars = Car.order('make ASC').order('model ASC').order('color ASC')
  end

  # GET /assignments/1/edit
  def edit
    @request = Request.find_by_request_id(@assignment.request_id)
    @cars = Car.order('make ASC').order('model ASC').order('color ASC')
  end

  # POST /assignments or /assignments.json
  def create
    @assignment = Assignment.new(assignment_params)
    @request = Request.find(params[:request_id])

    respond_to do |format|
      if @assignment.save
        # update the entire queue and the status of the appropriate request
        @request = Request.find_by_request_id(@assignment.request_id)
        Request.where('queue_pos > :pos', pos: @request.queue_pos).each do |request|
          request.update_attribute(:queue_pos, request.queue_pos - 1)
        end
        @request.update_attribute(:queue_pos, 0)
        @request.update_attribute(:request_status, 'Assigned Driver')

        # recording which member made the assignment
        @assignment.update_attribute(:member_id, current_member.member_id)

        format.html { redirect_to assignments_riding_url, notice: 'Assignment was successfully created.' }
        format.json { head :no_content }
      else
        # this line was necessary to prevent website from erroring out upon rerouting
        @cars = Car.order('make ASC').order('model ASC').order('color ASC')

        format.html { render :assign, status: :unprocessable_entity }
        format.json { render json: @assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /assignments/1 or /assignments/1.json
  def update
    respond_to do |format|
      if @assignment.update(assignment_params)
        format.html { redirect_to assignments_riding_url, notice: 'Assignment was successfully updated.' }
        format.json { head :no_content }
      else
        # this line was necessary to prevent website from erroring out upon rerouting
        @request = Request.find_by_request_id(@assignment.request_id)
        @cars = Car.order('make ASC').order('model ASC').order('color ASC')

        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /assignments/1/dropped_off
  def dropped_off
    @assignment.update_attribute(:drop_off_time, DateTime.now.strftime('%d/%m/%Y %H:%M'))

    respond_to do |format|
      format.html { redirect_to assignment_url(@assignment), notice: 'Assignment was successfully updated.' }
      format.json { head :no_content }
    end
  end

  # DELETE /assignments/1 or /assignments/1.json
  def destroy
    @assignment.destroy

    respond_to do |format|
      format.html { redirect_to assignments_url, notice: 'Assignment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_assignment
    @assignment = Assignment.find(params[:id])
  end

  def set_assignment_id
    @assignment = Assignment.find(params[:assignment_id])
  end

  # Only allow a list of trusted parameters through.
  def assignment_params
    params.require(:assignment).permit(:request_id, :car_id, :notes)
  end

  # Used for the search feature on the queue page
  def request_params
    params.require(:request).permit(:search_name, :search_phone_number)
  end
end

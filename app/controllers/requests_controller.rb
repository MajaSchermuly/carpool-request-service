# frozen_string_literal: true

require 'date'

class RequestsController < ApplicationController
  before_action :set_request, only: %i[show edit update destroy]
  before_action :set_request_id, only: %i[status done cancel]
  before_action :insure_active_ndr, only: %i[new]

  # GET /requests or /requests.json
  def index
    @requests = Request.all.order('request_id ASC')
  end

  # GET /request_list
  def list
    ndr_id = params[:ndr_id]
    @ndr = Ndr.find_by(ndr_id: ndr_id)
    @requests = Request.all.where(created_at: (@ndr.start_time)..).where(created_at: ..(@ndr.end_time))

    @requests&.each do |request|
      assignment = Assignment.find_by_request_id(request&.request_id)
      @wait_avg = if @wait_avg.nil?
                    time_waiting(request)
                  else
                    @wait_avg + time_waiting(request)
                  end

      @trip_avg = if @trip_avg.nil?
                    time_rode(assignment)
                  else
                    @trip_avg + time_rode(assignment)
                  end
    end

    @wait_avg = if !@wait_avg.nil?
                  (@wait_avg.to_f / @requests.count)
                else
                  0
                end

    @trip_avg = if !@trip_avg.nil?
                  (@trip_avg.to_f / @requests.count)
                else
                  0
                end

    if @requests.nil?
      @cnt = 0
      @done = 0
      @cancelled = 0
      @missed = 0
      @people = 0
    else
      @cnt = @requests&.count
      @done = @requests&.where(request_status: 'Done')&.count
      @cancelled = @requests&.where(request_status: 'Cancelled')&.count
      @missed = @requests&.where(request_status: 'Missed')&.count
      @people = @requests&.sum(:num_passengers)
    end
  end

  # GET /requests/waiting
  def waiting
    @requests = Request.where(request_status: 'Unassigned').order('created_at ASC')
  end

  # GET /requests/1 or /requests/1.json
  def show; end

  # GET /requests/new
  def new
    @request = Request.new
  end

  # GET /requests/incoming
  def incoming
    @request = Request.new
  end

  # GET /requests/1/edit
  def edit; end

  # POST /requests or /requests.json
  def create
    @request = Request.new(request_params)

    respond_to do |format|
      if @request.save
        # update the queue position of the request
        next_queue_pos = Request.where(request_status: 'Unassigned').count + 1
        @request.update_attribute(:queue_pos, next_queue_pos)
        @request.update_attribute(:request_status, 'Unassigned')

        if current_member
          format.html { redirect_to requests_waiting_url, notice: 'Request was successfully created.' }
          format.json { head :no_content }
        end

        search_query_path = "/queue/?search_name=#{@request.name}&search_phone_number=#{@request.phone_number}"
        format.html { redirect_to search_query_path, notice: 'Request was successfully created.' }
        format.json { head :no_content }
      else
        if current_member
          format.html { render :incoming, status: :unprocessable_entity }
          format.json { render json: @request.errors, status: :unprocessable_entity }
        end

        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /requests/1 or /requests/1.json
  def update
    respond_to do |format|
      if @request.update(request_params)
        # update the queue position accordingly, if request status is changed
        @request.update_attribute(:queue_pos, 0) if @request.request_status != 'Unassigned'

        if current_member
          format.html { redirect_to requests_waiting_url, notice: 'Request was successfully updated.' }
          format.json { head :no_content }
        end

        search_query_path = "/queue/?search_name=#{@request.name}&search_phone_number=#{@request.phone_number}"
        format.html { redirect_to search_query_path, notice: 'Request was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /requests/1/status
  def status; end

  # POST /requests/1/done
  def done
    @request.update_attribute(:request_status, 'Done')

    # if the time dropped off wasn't declared by driver, save current time
    @assignment = Assignment.find_by(request_id: @request.request_id)
    @assignment.update_attribute(:drop_off_time, DateTime.now.strftime('%d/%m/%Y %H:%M')) unless @assignment.drop_off_time

    respond_to do |format|
      format.html { redirect_to assignments_done_path, notice: 'Request was successfully finished.' }
      format.json { head :no_content }
    end
  end

  # POST /requests/1/cancel
  def cancel
    # update the queue position of all requests later in the queue
    if @request.queue_pos.positive?
      Request.where('queue_pos > :pos', pos: @request.queue_pos).each do |request|
        request.update_attribute(:queue_pos, request.queue_pos - 1)
      end
    end

    @request.update_attribute(:queue_pos, 0)
    # request is declared missed if time waited greater than 30min
    if helpers.time_dur(@request) > 30
      @request.update_attribute(:request_status, 'Missed')
    else
      @request.update_attribute(:request_status, 'Cancelled')
    end
    @request.update_attribute(:time_cancelled, DateTime.now.strftime('%d/%m/%Y %H:%M'))

    respond_to do |format|
      if current_member
        format.html { redirect_back fallback_location: requests_waiting_url, notice: 'Request was successfully cancelled.' }
        format.json { head :no_content }
      end

      search_query_path = "/queue/?search_name=#{@request.name}&search_phone_number=#{@request.phone_number}"
      format.html { redirect_to search_query_path, notice: 'Request was successfully cancelled.' }
      format.json { head :no_content }
    end
  end

  # DELETE /requests/1 or /requests/1.json
  def destroy
    # update the queue position of all requests later in the queue
    if @request.queue_pos.positive?
      Request.where('queue_pos > :pos', pos: @request.queue_pos).each do |request|
        request.update_attribute(:queue_pos, request.queue_pos - 1)
      end
    end

    @request.destroy

    respond_to do |format|
      format.html { redirect_to requests_url, notice: 'Request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Insures there is an active NDR
  def insure_active_ndr
    unless check_for_active_ndr
      flash[:notice] = 'Currently the service is not active.'
      redirect_to root_path
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_request
    @request = Request.find(params[:id])
  end

  def set_request_id
    @request = Request.find(params[:request_id])
  end

  # Only allow a list of trusted parameters through.
  def request_params
    params.require(:request).permit(:name, :phone_number, :request_status, :pick_up_loc, :drop_off_loc, :num_passengers, :additional_info)
  end

  def time_waiting(request)
    "#{((DateTime.now - request.created_at.to_datetime) * 24 * 60).to_i}m"
  end

  def time_rode(assignment)
    # making sure drop off time was specified
    if assignment.drop_off_time
      "#{((assignment.drop_off_time.to_datetime - assignment.created_at.to_datetime) * 24 * 60).to_i}m"
    # otherwise default to ''
    else
      ''
    end
  end

end

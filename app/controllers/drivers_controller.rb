# frozen_string_literal: true

class DriversController < ApplicationController
  before_action :set_driver, only: %i[show edit update destroy]
  before_action :authenticate_driver!, only: :checkin
  # GET /drivers or /drivers.json
  def index
    @drivers = Driver.all
  end

  # GET /driver_lsit
  def list
    ndr_id = params[:ndr_id]
    @ndr = Ndr.find_by(ndr_id: ndr_id)
    @drivers = Driver.all.where(ndr_id: ndr_id)
  end

  # GET /driver/1 or /driver/1.json
  def show; end

  # GET /driver/new
  def new
    @driver = Driver.new
  end

  # GET /driver/1/edit
  def edit; end

  # POST /driver or /driver.json
  def create
    @driver = Driver.new(driver_params)

    respond_to do |format|
      if @driver.save
        format.html { redirect_to driver_url(@driver), notice: 'Driver was successfully created.' }
        format.json { render :show, status: :created, location: @driver }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @driver.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /driver/1 or /driver/1.json
  def update
    respond_to do |format|
      if @driver.update(driver_params)
        format.html { redirect_to driver_url(@driver), notice: 'Driver was successfully updated.' }
        format.json { render :show, status: :ok, location: @driver }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @driver.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /driver/1 or /driver/1.json
  def destroy
    @driver.destroy

    respond_to do |format|
      format.html { redirect_to driver_url, notice: 'Driver was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # POST /driver/checkin_update
  def checkin_update
    @driver = Driver.find_by(member_id: current_member.member_id, ndr_id: Ndr.find_by(is_active: true))
    if params[:driver_status] != 'Other'
      @driver.update_attribute(:driver_status, params[:driver_status])
    else
      @driver.update_attribute(:driver_status, params[:driver_status_other])
    end
    # @driver.update_attribute(:driver_status, :driver_status)
    @driver.update_attribute(:check_in_time, DateTime.now)
    p @driver
    redirect_to root_path
  end

  # GET /driver/join
  def join
    @driver = Driver.new
    @ndr = Ndr.find(params[:ndr_id])
    @member = Member.find_by(member_id: current_member.member_id)
  end

  # POST /driver/join
  def join_confirm
    @driver = Driver.new(driver_params)
    @ndr = Ndr.find(params[:ndr_id])
    @member = Member.find_by(member_id: current_member.member_id)

    respond_to do |format|
      if @driver.save
        @ndr = Ndr.find_by(ndr_id: @driver.ndr_id)
        @ndr.update_attribute(:num_members_signed_up, @ndr.num_members_signed_up + 1)

        format.html { redirect_to ndrs_path, notice: 'Driver was successfully created.' }
        format.json { head :no_content }
      else

        format.html { render :join, status: :unprocessable_entity }
        format.json { render json: @driver.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /drivers/1/leave
  def leave
    @driver = Driver.find(params[:driver_id])
    @driver.destroy
    @ndr = Ndr.find_by(ndr_id: @driver.ndr_id)
    @ndr.update_attribute(:num_members_signed_up, @ndr.num_members_signed_up - 1)

    respond_to do |format|
      if current_member
        format.html { redirect_back fallback_location: ndrs_path, notice: 'Driver was successfully Deleted.' }
        format.json { head :no_content }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def get_name
    Member.find_by(member_id: @driver.member_id)
  end

  def set_driver
    @driver = Driver.find(params[:id])
  end

  def set_driver_id
    @driver = Driver.find(params[:driver_id])
  end

  # Only allow a list of trusted parameters through.
  def driver_params
    params.require(:driver).permit(:member_id, :car_id, :check_in_time, :driver_status, :ndr_id)
  end

  def driver_update_params
    params.permit(:driver_status, :driver_status_other)
  end

  # Makes sure an NDR is active and the current member is signed up as a driver
  def authenticate_driver!
    p Driver.where(member_id: current_member.member_id, ndr_id: Ndr.where(is_active: true)).empty?
    p Driver.where(member_id: current_member.member_id, ndr_id: Ndr.where(is_active: true))
    redirect_to ndrs_path, notice: 'Please join a NDR to view your check-in' if Driver.where(member_id: current_member.member_id, ndr_id: Ndr.where(is_active: true)).empty?
  end
end

# frozen_string_literal: true

class NdrsController < ApplicationController
  before_action :set_ndr, only: %i[show edit update destroy]
  helper_method :get_join_status
  # GET /ndrs or /ndrs.json
  def index
    @ndrs = if current_member.is_admin || current_member.is_supervisor
              Ndr.all
            else
              Ndr.where(is_active: true) + Ndr.where(is_active: false).where(end_time: DateTime.now..)
            end
  end

  # GET /ndrs/1 or /ndrs/1.json
  def show; end

  # GET /ndrs/new
  def new
    @ndr = Ndr.new
  end

  # GET /ndrs/1/edit
  def edit; end

  # POST /ndrs or /ndrs.json
  def create
    @ndr = Ndr.new(ndr_params)
    @ndr.member_id = current_member
    respond_to do |format|
      if @ndr.save
        format.html { redirect_to ndr_url(@ndr), notice: 'Ndr was successfully created.' }
        format.json { render :show, status: :created, location: @ndr }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ndr.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ndrs/1 or /ndrs/1.json
  def update
    respond_to do |format|
      if @ndr.update(ndr_params)
        format.html { redirect_to ndr_url(@ndr), notice: 'Ndr was successfully updated.' }
        format.json { render :show, status: :ok, location: @ndr }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ndr.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ndrs/1 or /ndrs/1.json
  def destroy
    @ndr.destroy

    respond_to do |format|
      format.html { redirect_to ndrs_url, notice: 'Ndr was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # Detect if member has already signed up for ndr
  def get_join_status(test_ndr, test_member)
    Driver.find_by(ndr_id: test_ndr.ndr_id, member_id: test_member.member_id).nil?
  end

  # GET button_control
  def button_control
    if current_member.is_admin
      @curr_ndr = Ndr.find_by(is_active: true)
      if !@curr_ndr.nil?
        @ndr_active = true
        @active = @curr_ndr.button_override != true
      else
        @ndr_active = false
      end
    else
      redirect_to :root
    end
  end

  # POST button_control
  def disable_button
    @dis_ndr = Ndr.find_by(is_active: true)
    unless @dis_ndr.nil?
      @dis_ndr.update_attribute(:button_override, true)
      @active = false
    end
    redirect_to :button_control
  end

  # POST button_control
  def enable_button
    @dis_ndr = Ndr.find_by(is_active: true)
    unless @dis_ndr.nil?
      @dis_ndr.update_attribute(:button_override, false)
      @active = true
    end
    redirect_to :button_control
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_ndr
    @ndr = Ndr.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def ndr_params
    params.require(:ndr).permit(:start_time, :end_time, :ndr_id, :is_active, :num_members_desired, :training_restrict, :dues_restrict)
  end
end

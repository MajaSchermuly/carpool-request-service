# frozen_string_literal: true

class CarsController < ApplicationController
  before_action :set_car, only: %i[show edit update destroy]

  # GET /cars or /cars.json
  def index
    @cars = Car.all
  end

  # GET /cars/
  def list
    ndr_id = params[:ndr_id]
    @cars = Car.all.where(ndr_id: params[:ndr_id])
    @ndr = Ndr.find_by(ndr_id: ndr_id)
    @drivers = Driver.all.where(ndr_id: ndr_id)
    p @drivers
    @drivers.each do |driver|
      @cars = if @cars.nil?
                Car.all.where(car_id: driver.car_id)
              else
                @cars + Car.all.where(car_id: driver.car_id)
              end
    end

    @cars = @cars.uniq unless @cars.nil?
  end

  # GET /cars/1 or /cars/1.json
  def show; end

  # GET /cars/new
  def new
    @car = Car.new
    @drivers = Driver.where(ndr_id: params[:ndr_id])
  end

  # GET /cars/1/edit
  def edit; end

  # POST /cars or /cars.json
  def create
    @car = Car.new(car_params)

    if params[:driver_ids] && (params[:driver_ids].count > 2)
      format.html { redirect_to :new, notice: 'Can only assign up to two drivers' }
      format.json { head :no_content }
    end

    respond_to do |format|
      if @car.save
        driver_ids = params[:driver_ids] # get the selected driver ids from the form submission
        driver_ids&.each do |driver_id|
          driver = Driver.find(driver_id)
          driver.car_id = @car.id # set the car foreign key on the driver object
          driver.save
        end

        format.html { redirect_to car_url(@car), notice: 'Car was successfully created.' }
        format.json { render :show, status: :created, location: @car }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cars/1 or /cars/1.json
  def update
    respond_to do |format|
      if @car.update(car_params)
        format.html { redirect_to car_url(@car), notice: 'Car was successfully updated.' }
        format.json { render :show, status: :ok, location: @car }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cars/1 or /cars/1.json
  def destroy
    @car.destroy

    respond_to do |format|
      format.html { redirect_to cars_url, notice: 'Car was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_car
    @car = Car.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def car_params
    params.require(:car).permit(:make, :model, :color, :plate_number, :registration_expiry, :ndr, :display_id, :ndr_id)
  end
end

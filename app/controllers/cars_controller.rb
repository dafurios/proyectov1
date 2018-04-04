class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!


  # GET /cars
  # GET /cars.json
  def index

    @enterprise = current_user
    @cars = @enterprise.cars

    #logeando vista drivers con autos
    # @drivers = @enterprise.drivers
    # @cars = Car.all
  end

  # GET /cars/1
  # GET /cars/1.json
  def show
  end

  # GET /cars/new
  def new
    @enterprise = current_user
    @car = Car.new
  end

  # GET /cars/1/edit
  def edit
  end

  # POST /cars
  # POST /cars.json
  def create

    if current_user
      @car = Car.new(car_params)
      @car.enterprise = current_user

      respond_to do |format|
        if @car.save
          format.html { redirect_to enterprise_drivers_path, notice: 'Car was successfully created.' }
          format.json { render :show, status: :created, location: @car }
        else
          format.html { render :new }
          format.json { render json: @car.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to enterprise_drivers_path, alert: 'Debes completar tu perfil antes de crear Vehiculos!'
    end
  end

  # PATCH/PUT /cars/1
  # PATCH/PUT /cars/1.json
  def update
    respond_to do |format|
      if @car.update(car_params)
        format.html { redirect_to enterprise_drivers_path, notice: 'Car was successfully updated.' }
        format.json { render :show, status: :ok, location: @car }
      else
        format.html { render :edit }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cars/1
  # DELETE /cars/1.json
  def destroy
    @car.destroy
    respond_to do |format|
      format.html { redirect_to enterprise_drivers_path(current_user), notice: 'Car was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_car
    @car = Car.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def car_params
    params.require(:car).permit(:type_car, :brand, :model, :year, :color, :plate, :tech_rev, :nation_registry, :user_id)
  end
end

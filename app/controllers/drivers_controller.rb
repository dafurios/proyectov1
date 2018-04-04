class DriversController < ApplicationController
  before_action :set_driver, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # load_and_authorize_resource


  # GET /drivers
  # GET /drivers.json
  def index

    @enterprise = current_user
    @drivers = @enterprise.drivers

    #logeando vista drivers con autos desde enterprise
    @cars = @enterprise.cars
    # @drivers = Driver.all
  end

  # GET /drivers/1
  # GET /drivers/1.json
  def show
  end

  # GET /drivers/new
  def new
    @enterprise = current_user
    @driver = Driver.new
  end

  # GET /drivers/1/edit
  def edit
  end

  # POST /drivers
  # POST /drivers.json
  def create

    if current_user
      @driver = Driver.new(driver_params)
      @driver.role = 1
      @driver.enterprise = current_user

      respond_to do |format|
        if @driver.save
          format.html { redirect_to enterprise_drivers_path, notice: 'Driver was successfully created.' }
          format.json { render :show, status: :created, location: @driver }
        else
          format.html { render :new }
          format.json { render json: @driver.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to enterprise_drivers_path, alert: 'Debes completar tu perfil antes de crear Conductores!'
    end
  end

  # PATCH/PUT /drivers/1
  # PATCH/PUT /drivers/1.json
  def update
    if (params[:driver][:password].blank? && params[:driver][:password_confirmation].blank?)
      params[:driver].delete("password")
      params[:driver].delete("password_confirmation")
    end
    respond_to do |format|
      if @driver.update(driver_params)
        format.html { redirect_to enterprise_drivers_path, notice: 'Driver was successfully updated.' }
        format.json { render :show, status: :ok, location: @driver }
      else
        format.html { render :edit }
        format.json { render json: @driver.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /drivers/1
  # DELETE /drivers/1.json
  def destroy
    @driver.destroy
    respond_to do |format|
      format.html { redirect_to enterprise_drivers_path(current_user), notice: 'Driver was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_driver
    @driver = Driver.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def driver_params
    params.fetch(:driver).permit(:image, :rut, :password, :email, :name, :lastname, :surname,:address, :commune, :state, :city, :country, :phone, :school, :work_child, :type_driver_license, :info_emergency, :enterprise_id)
  end
end

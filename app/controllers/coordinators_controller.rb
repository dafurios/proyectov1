class CoordinatorsController < ApplicationController

  before_action :set_coordinator, only: [:show, :edit, :update]
  before_action :authenticate_user!


  def index
    @coordinator = current_user

    #para buscar la info de autos y choferes asociados al coordinador
    # @drivers = @enterprise.drivers
    # @cars = @enterprise.cars

    #para buscar la info de alumnos y tutores asociados al coordinador
    # @students = @tutor.students
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @coordinator.update(coordinator_params)
        format.html { redirect_to coordinator_path(@coordinator), notice: 'Coordinator was successfully updated.' }
        format.json { render :show, status: :ok, location: @coordinator }
      else
        format.html { render :edit }
        format.json { render json: @coordinator.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_coordinator
    @coordinator = Coordinator.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def coordinator_params
    params.require(:coordinator).permit(:image, :rut, :name, :email, :r_legal, :rut_legal, :giro, :address, :commune, :state, :city, :country, :phone, :school, :role, :info_emergency, :user_id)
  end

end

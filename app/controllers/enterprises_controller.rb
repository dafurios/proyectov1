class EnterprisesController < ApplicationController
  before_action :set_enterprise, only: [:show, :edit, :update]
  before_action :authenticate_user!


  def index
    @enterprise = current_user

  end

  def show
  end

  def edit
  end

  def update

    respond_to do |format|
      if @enterprise.update(enterprise_params)
        format.html { redirect_to enterprise_drivers_path(@enterprise), notice: 'Driver was successfully updated.' }
        format.json { render :show, status: :ok, location: @enterprise }
      else
        format.html { render :edit }
        format.json { render json: @enterprise.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_enterprise
    @enterprise = Enterprise.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def enterprise_params
    params.require(:enterprise).permit(:image, :rut, :name, :email, :r_legal, :rut_legal, :giro, :address, :commune, :state, :city, :country, :phone, :school, :role, :info_emergency, :user_id)
  end

end

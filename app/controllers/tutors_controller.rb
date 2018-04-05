class TutorsController < ApplicationController
  before_action :set_tutor, only: [:show, :edit, :update]
  before_action :authenticate_user!
  # load_and_authorize_resource


  def index
    @tutor = current_user
  end

  def show
  end

  def edit
    @commune = Commune.all
  end

  def update
    respond_to do |format|
      if @tutor.update(tutor_params)
        format.html { redirect_to tutor_students_path(@tutor), notice: 'Tutor was successfully updated.' }
        format.json { render :show, status: :ok, location: @tutor }
      else
        format.html { render :edit }
        format.json { render json: @tutor.errors, status: :unprocessable_entity }
      end
    end
  end



  private
  # Use callbacks to share common setup or constraints between actions.
  def set_tutor
    @tutor = Tutor.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def tutor_params
    params.require(:tutor).permit(:image, :rut, :name, :lastname, :surname, :address, :commune_id, :state, :city, :country, :phone, :school, :level, :course, :user_id)
  end


end

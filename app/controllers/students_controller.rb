class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!


  # GET /students
  # GET /students.json
  def index
    @tutor = current_user
    # @tutors = current_user
    @students = @tutor.students

    # @students = Student.all
  end

  # GET /students/1
  # GET /students/1.json
  def show
  end

  # GET /students/new
  def new
    @tutor = current_user
    @student = Student.new
    # @commune = Commune.all
  end

  # GET /students/1/edit
  def edit
    # @commune = Commune.all
  end

  # POST /students
  # POST /students.json
  def create
    if current_user
      @student = Student.new(student_params)

      @student.tutor = current_user


      # @student.school_id = School.find(params[:student][:school_id]).id

      respond_to do |format|
        if @student.save
          format.html { redirect_to tutor_students_path, notice: 'Student was successfully created.' }
          format.json { render :show, status: :created, location: @student }
        else
          format.html { render :new, notice: 'faltan datos'}
          format.json { render json: @student.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to tutor_students_path, alert: 'Debes completar tu perfil antes de crear estudiantes!'
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to tutor_students_path, notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy

    respond_to do |format|
      format.html { redirect_to tutor_students_path(current_user), notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_student
    @student = Student.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def student_params
    params.require(:student).permit(:image, :rut, :password, :email, :name, :lastname, :surname, :address, :commune_id, :state, :city, :country, :phone, :school_id, :level, :course)
  end
end

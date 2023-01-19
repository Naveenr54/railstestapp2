class EmplyoeesController < ApplicationController
  before_action :set_emplyoee, only: %i[ show edit update destroy ]

  # GET /emplyoees or /emplyoees.json
  def index
    @emplyoees = Emplyoee.all
  end

  # GET /emplyoees/1 or /emplyoees/1.json
  def show
  end

  # GET /emplyoees/new
  def new
    @emplyoee = Emplyoee.new
  end

  # GET /emplyoees/1/edit
  def edit
  end

  # POST /emplyoees or /emplyoees.json
  def create
    @emplyoee = Emplyoee.new(emplyoee_params)

    respond_to do |format|
      if @emplyoee.save
        format.html { redirect_to emplyoee_url(@emplyoee), notice: "Emplyoee was successfully created." }
        format.json { render :show, status: :created, location: @emplyoee }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @emplyoee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /emplyoees/1 or /emplyoees/1.json
  def update
    respond_to do |format|
      if @emplyoee.update(emplyoee_params)
        format.html { redirect_to emplyoee_url(@emplyoee), notice: "Emplyoee was successfully updated." }
        format.json { render :show, status: :ok, location: @emplyoee }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @emplyoee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /emplyoees/1 or /emplyoees/1.json
  def destroy
    @emplyoee.destroy

    respond_to do |format|
      format.html { redirect_to emplyoees_url, notice: "Emplyoee was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_emplyoee
      @emplyoee = Emplyoee.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def emplyoee_params
      params.require(:emplyoee).permit(:name, :age, :gender, :designation, :mobile)
    end
end

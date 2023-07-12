class CalendersController < ApplicationController
  before_action :set_calender, only: %i[ show edit update destroy ]

  # GET /calenders or /calenders.json
  def index
    @calenders = Calender.all
  end

  # GET /calenders/1 or /calenders/1.json
  def show
  end

  # GET /calenders/new
  def new
    @calender = Calender.new
  end

  # GET /calenders/1/edit
  def edit
  end

  # POST /calenders or /calenders.json
  def create
    @calender = Calender.new(calender_params)

    respond_to do |format|
      if @calender.save
        format.html { redirect_to calender_url(@calender), notice: "Calender was successfully created." }
        format.json { render :show, status: :created, location: @calender }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @calender.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /calenders/1 or /calenders/1.json
  def update
    respond_to do |format|
      if @calender.update(calender_params)
        format.html { redirect_to calender_url(@calender), notice: "Calender was successfully updated." }
        format.json { render :show, status: :ok, location: @calender }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @calender.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /calenders/1 or /calenders/1.json
  def destroy
    @calender.destroy

    respond_to do |format|
      format.html { redirect_to calenders_url, notice: "Calender was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_calender
      @calender = Calender.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def calender_params
      params.require(:calender).permit(:day, :begin_time, :close_time, :interval_s, :interval_e, :unit_minute, :no_use)
    end
end

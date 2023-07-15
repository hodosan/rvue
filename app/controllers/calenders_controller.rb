class CalendersController < ApplicationController
  before_action :set_calender, only: %i[ show edit update destroy ]

  include CalenderData

  # GET /calenders or /calenders.json
  def index
    @calenders = Calender.all
    month = params[:month]
    calender_for_view(month)

    regulation    = Regulation.last
    @begin_time   = regulation.begin_time
    @close_time   = regulation.close_time
    @interval_s   = regulation.interval_s
    @interval_e   = regulation.interval_e
    @unit_minute  = regulation.unit_minute
  end

  # GET /calenders/1 or /calenders/1.json
  def show
  end

  # GET /calenders/new
  def new
    @calender = Calender.new
    @calender.day         = params[:day] 
    @calender.begin_time  = params[:day] + 'T' + params[:begin_time]
    @calender.close_time  = params[:day] + 'T' + params[:close_time]
    @calender.interval_s  = params[:day] + 'T' + params[:interval_s]
    @calender.interval_e  = params[:day] + 'T' + params[:interval_e]
    @calender.unit_minute = params[:unit_minute]
  end

  # GET /calenders/1/edit
  def edit
  end

  # POST /calenders or /calenders.json
  def create
    @calender = Calender.new(calender_params)

    respond_to do |format|
      if @calender.save
        format.html { redirect_to calenders_url, notice: "Calender was successfully created." }
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
        format.html { redirect_to calenders_url, notice: "Calender was successfully updated." }
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

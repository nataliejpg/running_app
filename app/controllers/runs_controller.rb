class RunsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_run, only: [:show, :edit, :update, :destroy]

  # GET /runs
  # GET /runs.json
  def index
    @runs=Run.where(:user_id => current_user.id).all.sort_by{|t| t[:date]}.reverse
  end

  # GET /runs/1
  # GET /runs/1.json
  def show
  end

  def records
    @pace = Run.where(:user_id => current_user.id).all.sort_by{:pace}[0]
    @distance=Run.where(:user_id => current_user.id).all.sort_by{:distance}[0]
    @time=Run.where(:user_id => current_user.id).all.sort_by{:duration}[0]
    render 'records'
  end

  # GET /runs/new
  def new
    @run = Run.new
  end

  # GET /runs/1/edit
  def edit
  end

  # POST /runs
  # POST /runs.json
  def create
    @run = Run.new(run_params)
    @run.user=current_user

    respond_to do |format|
      if @run.save
        format.html { redirect_to @run, notice: 'Run was successfully created.' }
        format.json { render action: 'show', status: :created, location: @run }
      else
        format.html { render action: 'new' }
        format.json { render json: @run.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /runs/1
  # PATCH/PUT /runs/1.json
  def update
    @run.user=current_user
    respond_to do |format|
      if @run.update(run_params)
        format.html { redirect_to @run, notice: 'Run was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @run.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /runs/1
  # DELETE /runs/1.json
  def destroy
    @run.destroy
    respond_to do |format|
      format.html { redirect_to runs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_run
      @run = Run.where(:user_id => current_user.id).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def run_params
      params.require(:run).permit(:date, :duration_time, :distance, :description, :place_id)
    end
end

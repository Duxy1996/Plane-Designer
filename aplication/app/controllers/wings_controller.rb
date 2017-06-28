class WingsController < ApplicationController
  before_action :set_wing, only: [:show, :edit, :update, :destroy]

  # GET /wings
  # GET /wings.json
  def index
    @wings = Wing.all
  end

  # GET /wings/1
  # GET /wings/1.json
  def show
  end

  # GET /wings/new
  def new
    @wing = Wing.new
  end

  # GET /wings/1/edit
  def edit
  end

  # POST /wings
  # POST /wings.json
  def create
    @wing = Wing.new(wing_params)

    respond_to do |format|
      if @wing.save
        format.html { redirect_to @wing, notice: 'Wing was successfully created.' }
        format.json { render :show, status: :created, location: @wing }
      else
        format.html { render :new }
        format.json { render json: @wing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wings/1
  # PATCH/PUT /wings/1.json
  def update
    respond_to do |format|
      if @wing.update(wing_params)
        format.html { redirect_to @wing, notice: 'Wing was successfully updated.' }
        format.json { render :show, status: :ok, location: @wing }
      else
        format.html { render :edit }
        format.json { render json: @wing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wings/1
  # DELETE /wings/1.json
  def destroy
    @wing.destroy
    respond_to do |format|
      format.html { redirect_to wings_url, notice: 'Wing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wing
      @wing = Wing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wing_params
      params.require(:wing).permit(:name, :description)
    end
end

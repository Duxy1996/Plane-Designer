class FuselagesController < ApplicationController
  before_action :set_fuselage, only: [:show, :edit, :update, :destroy]

  # GET /fuselages
  # GET /fuselages.json
  def index
    @fuselages = Fuselage.all
  end

  # GET /fuselages/1
  # GET /fuselages/1.json
  def show
  end

  # GET /fuselages/new
  def new
    @fuselage = Fuselage.new
  end

  # GET /fuselages/1/edit
  def edit
  end

  # POST /fuselages
  # POST /fuselages.json
  def create
    @fuselage = Fuselage.new(fuselage_params)

    respond_to do |format|
      if @fuselage.save
        format.html { redirect_to @fuselage, notice: 'Fuselage was successfully created.' }
        format.json { render :show, status: :created, location: @fuselage }
      else
        format.html { render :new }
        format.json { render json: @fuselage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fuselages/1
  # PATCH/PUT /fuselages/1.json
  def update
    respond_to do |format|
      if @fuselage.update(fuselage_params)
        format.html { redirect_to @fuselage, notice: 'Fuselage was successfully updated.' }
        format.json { render :show, status: :ok, location: @fuselage }
      else
        format.html { render :edit }
        format.json { render json: @fuselage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fuselages/1
  # DELETE /fuselages/1.json
  def destroy
    @fuselage.destroy
    respond_to do |format|
      format.html { redirect_to fuselages_url, notice: 'Fuselage was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fuselage
      @fuselage = Fuselage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fuselage_params
      params.require(:fuselage).permit(:name, :description)
    end
end

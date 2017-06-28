class TailsController < ApplicationController
  before_action :set_tail, only: [:show, :edit, :update, :destroy]

  # GET /tails
  # GET /tails.json
  def index
    @tails = Tail.all
  end

  # GET /tails/1
  # GET /tails/1.json
  def show
  end

  # GET /tails/new
  def new
    @tail = Tail.new
  end

  # GET /tails/1/edit
  def edit
  end

  # POST /tails
  # POST /tails.json
  def create
    @tail = Tail.new(tail_params)

    respond_to do |format|
      if @tail.save
        format.html { redirect_to @tail, notice: 'Tail was successfully created.' }
        format.json { render :show, status: :created, location: @tail }
      else
        format.html { render :new }
        format.json { render json: @tail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tails/1
  # PATCH/PUT /tails/1.json
  def update
    respond_to do |format|
      if @tail.update(tail_params)
        format.html { redirect_to @tail, notice: 'Tail was successfully updated.' }
        format.json { render :show, status: :ok, location: @tail }
      else
        format.html { render :edit }
        format.json { render json: @tail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tails/1
  # DELETE /tails/1.json
  def destroy
    @tail.destroy
    respond_to do |format|
      format.html { redirect_to tails_url, notice: 'Tail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tail
      @tail = Tail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tail_params
      params.require(:tail).permit(:name, :description)
    end
end

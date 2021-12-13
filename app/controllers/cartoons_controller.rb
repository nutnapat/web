class CartoonsController < ApplicationController
  before_action :set_cartoon, only: %i[ show edit update destroy ]

  # GET /cartoons or /cartoons.json
  def index
    @cartoons = Cartoon.all
  end

  # GET /cartoons/1 or /cartoons/1.json
  def show
  end

  # GET /cartoons/new
  def new
    @cartoon = Cartoon.new
  end

  # GET /cartoons/1/edit
  def edit
  end

  # POST /cartoons or /cartoons.json
  def create
    @cartoon = Cartoon.new(cartoon_params)

    respond_to do |format|
      if @cartoon.save
        format.html { redirect_to @cartoon, notice: "Cartoon was successfully created." }
        format.json { render :show, status: :created, location: @cartoon }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cartoon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cartoons/1 or /cartoons/1.json
  def update
    respond_to do |format|
      if @cartoon.update(cartoon_params)
        format.html { redirect_to @cartoon, notice: "Cartoon was successfully updated." }
        format.json { render :show, status: :ok, location: @cartoon }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cartoon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cartoons/1 or /cartoons/1.json
  def destroy
    @cartoon.destroy
    respond_to do |format|
      format.html { redirect_to cartoons_url, notice: "Cartoon was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cartoon
      @cartoon = Cartoon.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cartoon_params
      params.require(:cartoon).permit(:name, :status, :writer, :shortinfo, :daytoupdate , :image ,tags:[] )
    end
end

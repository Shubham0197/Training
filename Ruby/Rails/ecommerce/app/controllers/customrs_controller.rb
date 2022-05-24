class CustomrsController < ApplicationController
  before_action :set_customr, only: %i[ show edit update destroy ]

  # GET /customrs or /customrs.json
  def index
    @customrs = Customr.all
  end

  # GET /customrs/1 or /customrs/1.json
  def show
  end

  # GET /customrs/new
  def new
    @customr = Customr.new
  end

  # GET /customrs/1/edit
  def edit
  end

  # POST /customrs or /customrs.json
  def create
    @customr = Customr.new(customr_params)

    respond_to do |format|
      if @customr.save
        format.html { redirect_to customr_url(@customr), notice: "Customr was successfully created." }
        format.json { render :show, status: :created, location: @customr }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @customr.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customrs/1 or /customrs/1.json
  def update
    respond_to do |format|
      if @customr.update(customr_params)
        format.html { redirect_to customr_url(@customr), notice: "Customr was successfully updated." }
        format.json { render :show, status: :ok, location: @customr }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @customr.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customrs/1 or /customrs/1.json
  def destroy
    @customr.destroy

    respond_to do |format|
      format.html { redirect_to customrs_url, notice: "Customr was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customr
      @customr = Customr.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def customr_params
      params.require(:customr).permit(:name, :mobile_number, :email_address, :DOB)
    end
end

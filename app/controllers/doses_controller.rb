class DosesController < ApplicationController
  before_action :set_dose, only: [:show, :edit, :update, :destroy]

  # GET /doses
  # def index
  #   @doses = Dose.all
  # end

  # GET /doses/1
  def show
  end

  # GET /doses/new
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  # # GET /doses/1/edit
  # def edit
  # end

  # POST /doses
  def create
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail

      if @dose.save
        redirect_to @cocktail, notice: 'Dose was successfully created.' 
      else
        render :new
      end
  end

  # DELETE /doses/1
  def destroy
    @dose.destroy
    redirect_to cocktail_url(@cocktail), notice: 'Dose was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dose
      @dose = Dose.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def dose_params
      params.require(:dose).permit(:description, :ingredient_id)
    end
end

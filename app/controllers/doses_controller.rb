class DosesController < ApplicationController
  before_action :set_dose, only: [:show, :destroy]
  before_action :set_cocktail, only: [:new, :create]

  def index
    @doses = Dose.all
  end

  def new
    @dose = Dose.new
    @ingredients = Ingredient.all
  end

  def create

    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      @ingredients = Ingredient.all
      render :new
    end
  end

  def destroy
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end

  def show
  end

  private

  def set_dose
    @dose = Dose.find(params[:id])
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end
end
